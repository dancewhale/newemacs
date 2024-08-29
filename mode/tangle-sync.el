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
Jumps from output code to org src block."
  (interactive)
  (let ((org-src-window-setup 'current-window))
    (org-babel-tangle-jump-to-org))
  )


(general-define-key
    :prefix "s-e"
    "s-f"      '(cao-emacs-counsel-ag :which-key "grep in current directory.")
)



(provide 'tangle-sync)
;;; tangle-sync.el ends here
