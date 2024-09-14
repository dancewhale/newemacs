;;; init.el --- Hamacs Init -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;; This is my Emacs Bootloader. Simply put, I initialize the package management
;; system, and then tangle my literate files. This simple idea came from
;; https://github.com/susamn/dotfiles
;;
;;; Code:

;; Bug fixes for ORG (there always seems to be something):
(defvar native-comp-deferred-compilation-deny-list nil)

;; Allow the installation of unsigned packages, but verify the signature if possible:
(setq package-check-signature 'allow-unsigned)

;; Configure straight https://github.com/raxod502/straight.el#getting-started

(setq emacs-source-dir   user-emacs-directory)
(setq straight-base-dir (concat user-emacs-directory ".local/"))
(setq user-emacs-directory (concat straight-base-dir  "cache/"))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" 
			 (or straight-base-dir user-emacs-directory)))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; While that enables the :straight t extension to use-package, let's just have that be the default:
(use-package straight
  :custom (straight-use-package-by-default t
           straight-default-vc 'git))

;; for org babel tangle
(defconst org-babel-tangle-comment-format-beg "-------->>  [[%link][%source-name]]")
(defconst org-babel-tangle-comment-format-end "--------<<  %source-name ends here\n\n")
;; See the details in https://dev.to/jkreeftmeijer/emacs-package-management-with-straight-el-and-use-package-3oc8
(use-package org
  ;; TODO: Using the latest org-mode
  :straight (:type built-in)
  )

;; Let's rock:
(org-babel-load-file "bootstrap.org")

(provide 'init)
;;; init.el ends here
