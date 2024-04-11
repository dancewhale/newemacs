(defun learnify-open-emacsd-dir ()
  (interactive)
  (dired "~/.emacs.d"))


(general-define-key
 "s-e h h" #'learnify-open-emacsd-dir)


 
;; this is optional but might look better than defaults
;; You should use :comments link in babel block.
;; 用来在org 和org tangle 生成的el 代码块之间跳转,不支持行数对应关系.
(setq org-babel-tangle-comment-format-beg "-------->>  [[%link][%source-name]]")
(setq org-babel-tangle-comment-format-end "--------<<  %source-name ends here\n\n")

(defun sv-org-babel-tangle-jump-to-src ()
  "The opposite of `org-babel-tangle-jump-to-org'. Jumps at tangled code from org src block."
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
		    (org-babel-effective-tangled-filename buffer lang tangle))))
	(if (not (file-exists-p file))
	    (message "File does not exist. 'org-babel-tangle' first to create file.")
	  (find-file file)
	  (beginning-of-buffer)
	  (search-forward search-comment)
	  (next-line)
	  (beginning-of-line)))
    (message "Cannot jump to tangled file because point is not at org src block.")))

(defun sv-org-babel-tangle-jump-to-org ()
  (interactive)
  (let ((org-src-window-setup 'current-window))
    (org-babel-tangle-jump-to-org))
  )

(general-define-key
 "s-e l i" #'sv-org-babel-tangle-jump-to-src
 "s-e l o" #'sv-org-babel-tangle-jump-to-org)
