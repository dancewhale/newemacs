;;; early-init.el --- Hamacs Early Init -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;; This is my early Emacs configuration file.  See init.el for the real
;; boot process.  Since we are using straight or elpaca, we just need to
;; stop the normal package process.
;;
;;; Code:

;; We'll be using straight. So, we don't want duplicated package loading:
(setq package-enable-at-startup nil)

;; While I would rather program my configurations, sometimes the Emacs
;; menu system is _good enough_, but I want it in its own file:

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; TODO: Let's build the \`exec-path' from the _real_ shell path:
;; (add-to-list 'exec-path "path")
;; Local Variables:
;; no-byte-compile: t
;; no-native-compile: t
;; no-update-autoloads: t
;; End:

;;; early-init.el ends here

