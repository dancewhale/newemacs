;;; straight suggest to prevent package.el loading packages prior to their init-file loading.
(setq package-enable-at-startup nil)

(defvar bootstrap-version)
(setq straight-base-dir (concat user-emacs-directory ".local/"))
(setq user-emacs-directory (concat straight-base-dir  "cache/"))
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            (concat user-emacs-directory))))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package '(org :type built-in))
