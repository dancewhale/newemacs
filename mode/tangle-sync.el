;;; org-tanglesync.el --- Syncing org src blocks with tangled external files -*- lexical-binding: t; -*-

;;; Commentary:

;; Pulling external file changes to a tangled org-babel src block
;; is surprisingly not a well-implemented feature.  This addresses that.
;;

;;; Code:
(require 'org)
(require 'general)

(defconst org-babel-tangle-comment-format-beg "-------->>  [[%link][%source-name]]")
(defconst org-babel-tangle-comment-format-end "--------<<  %source-name ends here\n\n")

;; 由于output 后format 导致两者字符发生变化,比如空格被消去,导致跳转位置不会绝对一致
(defun tangle-sync-jump-to-output ()
  "The opposite of `tangle-sync-jump-to-org'.
Jumps from org src block to output code."
  (interactive)
  (if (org-in-src-block-p)
      (let* ((header (car (org-babel-tangle-single-block 1 'only-this-block)))
	     (tangle (car header))
	     (lang (caadr header))
	     (buffer (nth 2 (cadr header)))
	     (org-id (nth 3 (cadr header)))
	     (source-name (nth 4 (cadr header)))
	     (search-comment (org-fill-template
			      org-babel-tangle-comment-format-beg
			      `(("link" . ,org-id) ("source-name" . ,source-name))))
	     (file (expand-file-name
		    (org-babel-effective-tangled-filename buffer lang tangle)))
	     (mid (point))) ;; 获取当前位置
	;;jump to block body start point.
	(org-babel-goto-src-block-head)
	(forward-line)
	(beginning-of-line) ;; 移动到block 头获取开头位置
	(let ((body-start (point)))
	    (if (not (file-exists-p file))
	        (message "File does not exist. 'org-babel-tangle' first to create file.")
	      (find-file file)
	      (goto-char (point-min))
	      (search-forward search-comment)
	      (forward-line)
	      (beginning-of-line)
              (let ((offset (- mid body-start)))
              	  (forward-char offset)))))
    (message "Cannot jump to tangled file because point is not at org src block.")))


(defun tangle-sync-jump-to-org ()
  "The opposite of `tangle-sync-jump-to-output'.
Jump from a tangled code file to the related Org mode file.
Copy from elisp src and change some code to fix error."
  ;; (org-babel-tangle-jump-to-org) current window.
  (interactive)
  (let ((mid (point))
	start body-start end target-buffer target-char link block-name body)
    (save-window-excursion
      (save-excursion
	(while (and (re-search-backward org-link-bracket-re nil t)
		    (not ; ever wider searches until matching block comments
		     (and (setq start (line-beginning-position))
			  (setq body-start (line-beginning-position 2))
			  (setq link (match-string 0))
			  (setq block-name (match-string 2))
			  (save-excursion
			    (save-match-data
			      (re-search-forward
			       (concat " " (regexp-quote block-name)
				       " ends here")
			       nil t)
			      (setq end (line-beginning-position))))))))
	(unless (and start (< start mid) (< mid end))
	  (error "Not in tangled code"))
        (setq body (buffer-substring body-start end)))
      ;; Go to the beginning of the relative block in Org file.
      ;; Explicitly allow fuzzy search even if user customized
      ;; otherwise.
      (let (org-link-search-must-match-exact-headline)
        (org-link-open-from-string link))
      (setq target-buffer (current-buffer))
      (if (string-match "[^ \t\n\r]:\\([[:digit:]]+\\)" block-name)
          (let ((n (string-to-number (match-string 1 block-name))))
	    (if (org-before-first-heading-p) (goto-char (point-min))
	      (org-back-to-heading t))
	    ;; Do not skip the first block if it begins at point min.
	    (cond ((or (org-at-heading-p)
		       (not (eq (org-element-type (org-element-at-point))
				'src-block)))
		   (org-babel-next-src-block n))
		  ((= n 1))
		  (t (org-babel-next-src-block (1- n)))))
        (org-babel-goto-named-src-block block-name))
      (goto-char (org-babel-where-is-src-block-head))
      (forward-line 1)
      ;; Try to preserve location of point within the source code in
      ;; tangled code file.
      (let ((offset (- mid body-start)))
	  (forward-char offset))
      (setq target-char (point)))
    (org-src-switch-to-buffer target-buffer t)
    (goto-char target-char)
    body))


(general-define-key
 "s-e l i" #'tangle-sync-jump-to-src
 "s-e l o" #'tangle-sync-jump-to-org)
