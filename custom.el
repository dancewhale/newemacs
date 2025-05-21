(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-list-file-prefix "~/.emacs.d/.local/cache/auto-save-list/.saves-")
 '(ignored-local-variable-values
   '((system-time-locale . "C")
     (jinx-local-words . "Braganza Graphviz Malorana’s Proselint Somers Textlint Writegood flycheck flyspell fontlock")
     (jinx-local-words . "parseable")
     (eval add-hook 'after-save-hook #'org-babel-tangle t t)
     (elisp-lint-indent-specs
      (describe . 1)
      (it . 1)
      (thread-first . 0)
      (cl-flet . 1)
      (cl-flet* . 1)
      (org-element-map . defun)
      (org-roam-dolist-with-progress . 2)
      (org-roam-with-temp-buffer . 1)
      (org-with-point-at . 1)
      (magit-insert-section . defun)
      (magit-section-case . 0)
      (org-roam-with-file . 2))
     (elisp-lint-ignored-validators "byte-compile" "package-lint")))
 '(lsp-go-directory-filters ["-/opt/homebrew/"])
 '(lsp-go-library-directories '("/opt/homebrew/Cellar/go/"))
 '(straight-disable-compile t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
