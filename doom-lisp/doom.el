;;; doom.el --- the heart of the beast -*- lexical-binding: t; -*-
;;
;; Author:  Henrik Lissner <contact@henrik.io>
;; URL:     https://github.com/doomemacs/doomemacs
;;
;;   =================     ===============     ===============   ========  ========
;;   \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
;;   ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
;;   || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
;;   ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
;;   || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
;;   ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
;;   || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
;;   ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
;;   ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
;;   ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
;;   ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
;;   ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
;;   ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
;;   ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
;;   ||.=='    _-'                                                     `' |  /==.||
;;   =='    _-'                                                            \/   `==
;;   \   _-'                                                                `-_   /
;;    `''                                                                      ``'
;;
;; These demons are not part of GNU Emacs.
;;
;;; Commentary:
;;
;; This is Doom's heart, where I define all its major constants and variables,
;; set its saner global defaults, then prepare Emacs to bootstrap Doom.
;;
;; The overall load order of Doom is as follows:
;;
;;   > $EMACSDIR/early-init.el
;;     > $EMACSDIR/lisp/doom.el
;;       - $EMACSDIR/lisp/doom-lib.el
;;     > $EMACSDIR/lisp/doom-start.el
;;       - hook: `doom-before-init-hook'
;;       - $DOOMDIR/init.el
;;   - hook: `before-init-hook'
;;   > $XDG_DATA_HOME/doom/$PROFILE/@/$VERSION/init.el   (replaces $EMACSDIR/init.el)
;;     - $EMACSDIR/doom-{keybinds,ui,projects,editor}.el
;;     - hook: `doom-before-modules-init-hook'
;;     - {$DOOMDIR,$EMACSDIR}/modules/*/*/init.el
;;     - hook: `doom-after-modules-init-hook'
;;     - hook: `doom-before-modules-config-hook'
;;     - {$DOOMDIR,$EMACSDIR}/modules/*/*/config.el
;;     - hook: `doom-after-modules-config-hook'
;;     - $DOOMDIR/config.el
;;     - `custom-file' or $DOOMDIR/custom.el
;;   - hook: `after-init-hook'
;;   - hook: `emacs-startup-hook'
;;   - hook: `window-setup-hook'
;;   - hook: `doom-init-ui-hook'
;;   - hook: `doom-after-init-hook'
;;   > After startup is complete (if file(s) have been opened from the command
;;     line, these will trigger much earlier):
;;     - On first input:              `doom-first-input-hook'
;;     - On first switched-to buffer: `doom-first-buffer-hook'
;;     - On first opened file:        `doom-first-file-hook'
;;
;; This file is Doom's heart, where I define all its major constants and
;; variables, set only its sanest global defaults, employ its hackiest (and
;; least offensive) optimizations, and load the minimum needed for all Doom
;; sessions, interactive or otherwise.
;;
;; See doom-start.el for initialization intended solely for interactive
;; sessions, and doom-cli.el for non-interactive sessions.
;;
;;; Code:

;; For the `when-let*' and `if-let*' macros on older versions of Emacs, before
;; they were autoloaded.
(eval-when-compile (require 'subr-x))

(eval-and-compile
  ;; Doom core supports Emacs 27.1 and newer. However, keep in mind that modules
  ;; may have different requirements (e.g. the official module library requires
  ;; 29.x or newer).
  (when (< emacs-major-version 27)
    (user-error
     (concat
      "Detected Emacs " emacs-version ", but Doom requires 27.1 or newer (30.1 is\n\n"
      "recommended). The current Emacs executable in use is:\n\n  " (car command-line-args)
      "\n\nA guide for installing a newer version of Emacs can be found at:\n\n  "
      (format "https://docs.doomemacs.org/-/install/%s"
              (cond ((eq system-type 'darwin) "on-macos")
                    ((memq system-type '(cygwin windows-nt ms-dos)) "on-windows")
                    ("on-linux")))
      "\n\n"
      (if noninteractive
          (concat "Alternatively, either update your $PATH environment variable to include the\n"
                  "path of the desired Emacs executable OR alter the $EMACS environment variable\n"
                  "to specify the exact path or command needed to invoke Emacs."
                  (when-let ((script (cadr (member "--load" command-line-args)))
                             (command (file-name-nondirectory script)))
                    (concat " For example:\n\n"
                            "  $ EMACS=/path/to/valid/emacs " command " ...\n"
                            "  $ EMACS=\"/Applications/Emacs.app/Contents/MacOS/Emacs\" " command " ...\n"
                            "  $ EMACS=\"snap run emacs\" " command " ..."))
                  "\n\nAborting...")
        (concat "If you believe this error is a mistake, run 'doom doctor' on the command line\n"
                "to diagnose common issues with your config and system.")))))
  nil)

;; Doom needs to be synced/rebuilt if either Doom or Emacs has been
;; up/downgraded. This is because byte-code isn't backwards compatible, and many
;; packages (including Doom), bake in absolute paths into their caches that need
;; to be refreshed.
(let ((old-version (eval-when-compile emacs-major-version)))
  (unless (= emacs-major-version old-version)
    (user-error (concat "Doom was compiled with Emacs %s, but was loaded with %s. Run 'doom sync' to"
                        "recompile it.")
                emacs-major-version old-version)))

;;; Custom features & global constants
;; Doom has its own features that its modules, CLI, and user extensions can
;; announce, and don't belong in `features', so they are stored here, which can
;; include information about the external system environment.
(defconst doom-system
  (pcase system-type
    ('darwin                           '(macos bsd))
    ((or 'cygwin 'windows-nt 'ms-dos)  '(windows))
    ((or 'gnu 'gnu/linux)              '(linux))
    ((or 'gnu/kfreebsd 'berkeley-unix) '(linux bsd))
    ('android                          '(android)))
  "A list of symbols denoting available features in the active Doom profile.")

;; Convenience aliases for internal use only (may be removed later).
(defconst doom--system-windows-p (eq 'windows (car doom-system)))
(defconst doom--system-macos-p   (eq 'macos   (car doom-system)))
(defconst doom--system-linux-p   (eq 'linux   (car doom-system)))

;; Announce WSL if it is detected.
(when (and doom--system-linux-p
           (if (boundp 'operating-system-release) ; is deprecated since 28.x
               (string-match-p "-[Mm]icrosoft" operating-system-release)
             (getenv-internal "WSLENV")))
  (add-to-list 'doom-system 'wsl 'append))

;; `system-type' is esoteric, so I create a pseudo feature as a stable and
;; consistent alternative, for use with `featurep'.
(push :system features)
(put :system 'subfeatures doom-system)

;; Emacs needs a more consistent way to detect build features, and the docs
;; claim `system-configuration-features' is not da way. Some features (that
;; don't represent packages) can be found in `features' (which `featurep'
;; consults), but aren't consistent, so I'll impose some consistency:
(if (bound-and-true-p module-file-suffix)
    (push 'dynamic-modules features))
(if (fboundp #'json-parse-string)
    (push 'jansson features))
(if (string-match-p "HARFBUZZ" system-configuration-features) ; no alternative
    (push 'harfbuzz features))

;; The `native-compile' feature exists whether or not it is functional (e.g.
;; libgcc is available or not). This seems silly, as some packages will blindly
;; use the native-comp API if it's present but non-functional, so let's pretend
;; it doesn't exist if that's the case.
(if (featurep 'native-compile)
    (if (not (native-comp-available-p))
        (delq 'native-compile features)))

;; DEPRECATED: Remove in v3
(with-no-warnings
  (defconst IS-MAC      doom--system-macos-p)
  (defconst IS-LINUX    doom--system-linux-p)
  (defconst IS-WINDOWS  doom--system-windows-p)
  (defconst IS-BSD      (memq 'bsd doom-system))
  (defconst EMACS28+    (> emacs-major-version 27))
  (defconst EMACS29+    (> emacs-major-version 28))
  (defconst MODULES     (featurep 'dynamic-modules))
  (defconst NATIVECOMP  (featurep 'native-compile))

  (make-obsolete-variable 'IS-MAC     "Use (featurep :system 'macos) instead" "3.0.0")
  (make-obsolete-variable 'IS-LINUX   "Use (featurep :system 'linux) instead" "3.0.0")
  (make-obsolete-variable 'IS-WINDOWS "Use (featurep :system 'windows) instead" "3.0.0")
  (make-obsolete-variable 'IS-BSD     "Use (featurep :system 'bsd) instead" "3.0.0")
  (make-obsolete-variable 'EMACS28+   "Use (>= emacs-major-version 28) instead" "3.0.0")
  (make-obsolete-variable 'EMACS29+   "Use (>= emacs-major-version 29) instead" "3.0.0")
  (make-obsolete-variable 'MODULES    "Use (featurep 'dynamic-modules) instead" "3.0.0")
  (make-obsolete-variable 'NATIVECOMP "Use (featurep 'native-compile) instead" "3.0.0")

  (define-obsolete-variable-alias 'doom-private-dir 'doom-user-dir "3.0.0")
  (define-obsolete-variable-alias 'doom-etc-dir 'doom-data-dir "3.0.0"))

;; HACK: Silence obnoxious obsoletion warnings about (if|when)-let in >=31.
;;   These warnings are unhelpful to end-users, and many packages use these
;;   macros, so I silence these warnings to spare users the unactionable spam.
;;   Not to mention, Emacs doesn't respect `warning-suppress-types' when it
;;   comes to obsoletion warnings.
(put 'if-let 'byte-obsolete-info nil)
(put 'when-let 'byte-obsolete-info nil)


;;; Fix $HOME on Windows
;; $HOME isn't normally defined on Windows, but many unix tools expect it.
(when doom--system-windows-p
  (when-let* ((realhome
               (and (null (getenv-internal "HOME"))
                    (getenv "USERPROFILE"))))
    (setenv "HOME" realhome)
    (setq abbreviated-home-dir nil)))


;;; Load Doom's stdlib
(require 'doom-compat) ; backport niceties from later versions of Emacs
(require 'doom-lib)


;;
;;; Core globals

(defgroup doom nil
  "A development framework for Emacs configurations and Emacs Lisp projects."
  :link '(url-link "https://doomemacs.org")
  :group 'emacs)

(defconst doom-version "3.0.0-pre"
  "Current version of Doom Emacs core.")

;; DEPRECATED: Remove these when the modules are moved out of core.
(defconst doom-modules-version "25.07.0-pre"
  "Current version of Doom Emacs.")

(defvar doom-init-time nil
  "The time it took, in seconds (as a float), for Doom Emacs to start up.")

(defconst doom-profile
  (if-let* ((profile (getenv-internal "DOOMPROFILE")))
      (save-match-data
        (if (string-match "^\\([^@]+\\)@\\(.+\\)$" profile)
            (cons (match-string 1 profile)
                  (match-string 2 profile))
          (cons profile "0")))
    ;; TODO Restore this in 3.0
    ;; (cons "_" "0")
    )
  "The active profile as a cons cell (NAME . VERSION).")

(defconst doom-core-dir (file-truename (concat emacs-source-dir "doom-lisp/")))

(defconst doom-local-dir (file-truename (concat emacs-source-dir ".local/")))

;;; Module file variables
(defvar doom-module-init-file "init.el"
  "The filename for module early initialization config files.

Init files are loaded early, just after Doom core, and before modules' config
files. They are always loaded, even in non-interactive sessions, and before
`doom-before-modules-init-hook'. Related to `doom-module-config-file'.")

(defvar doom-module-config-file "config.el"
  "The filename for module configuration files.

Config files are loaded later, and almost always in interactive sessions. These
run before `doom-after-modules-config-hook' and after `doom-module-init-file'.")

(defvar doom-module-packages-file "packages.el"
  "The filename for the package configuration file.

Package files are read whenever Doom's package manager wants a manifest of all
desired packages. They are rarely read in interactive sessions (unless the user
uses a straight or package.el command directly).")



;;; Reduce unnecessary/unactionable warnings/logs
;; Disable warnings from the legacy advice API. They aren't actionable or
;; useful, and often come from third party packages.
(setq ad-redefinition-action 'accept)

;; Ignore warnings about "existing variables being aliased". Otherwise the user
;; gets very intrusive popup warnings about our (intentional) uses of
;; defvaralias, which are done because ensuring aliases are created before
;; packages are loaded is an unneeded and unhelpful maintenance burden. Emacs
;; still aliases them fine regardless.
(setq warning-suppress-types '((defvaralias) (lexical-binding)))

;; As some point in 31+, Emacs began spamming the user with warnings about
;; missing `lexical-binding' cookies in elisp files that you are unlikely to
;; have any direct control over (e.g. package files, data lisp files, and elisp
;; shell scripts). This shuts it up.
(setq warning-inhibit-types '((files missing-lexbind-cookie)))

;; Reduce debug output unless we've asked for it.
(setq debug-on-error init-file-debug
      jka-compr-verbose init-file-debug)

;;; Stricter security defaults
;; Emacs is essentially one huge security vulnerability, what with all the
;; dependencies it pulls in from all corners of the globe. Let's try to be a
;; *little* more discerning.
(setq gnutls-verify-error noninteractive
      gnutls-algorithm-priority
      (when (boundp 'libgnutls-version)
        (concat "SECURE128:+SECURE192:-VERS-ALL"
                (if (and (not doom--system-windows-p)
                         (>= libgnutls-version 30605))
                    ":+VERS-TLS1.3")
                ":+VERS-TLS1.2"))
      ;; `gnutls-min-prime-bits' is set based on recommendations from
      ;; https://www.keylength.com/en/4/
      gnutls-min-prime-bits 3072
      tls-checktrust gnutls-verify-error
      ;; Emacs is built with gnutls.el by default, so `tls-program' won't
      ;; typically be used, but in the odd case that it does, we ensure a more
      ;; secure default for it (falling back to `openssl' if absolutely
      ;; necessary). See https://redd.it/8sykl1 for details.
      tls-program '("openssl s_client -connect %h:%p -CAfile %t -nbio -no_ssl3 -no_tls1 -no_tls1_1 -ign_eof"
                    "gnutls-cli -p %p --dh-bits=3072 --ocsp --x509cafile=%t \
--strict-tofu --priority='SECURE192:+SECURE128:-VERS-ALL:+VERS-TLS1.2:+VERS-TLS1.3' %h"
                    ;; compatibility fallbacks
                    "gnutls-cli -p %p %h"))


;;; Package managers
;; Since Emacs 27, package initialization occurs before `user-init-file' is
;; loaded, but after `early-init-file'. Doom handles package initialization, so
;; we must prevent Emacs from doing it again.
(setq package-enable-at-startup nil)

;; Ensure that, if the user does want package.el, it is configured correctly.
;; You really shouldn't be using it, though...
(with-eval-after-load 'package
  (setq package-user-dir (file-name-concat doom-local-dir "elpa/")
        package-gnupghome-dir (expand-file-name "gpg" package-user-dir))
  (let ((s (if gnutls-verify-error "s" "")))
    (cl-callf2 append
        ;; I omit Marmalade because its packages are manually submitted rather
        ;; than pulled, and so often out of date.
        `(("melpa" . ,(format "http%s://melpa.org/packages/" s))
          ("org"   . ,(format "http%s://orgmode.org/elpa/"   s)))
        package-archives))

  ;; Refresh package.el the first time you call `package-install', so it's still
  ;; trivially usable. Remember to run 'doom sync' to purge them; they can
  ;; conflict with packages installed via straight!
  (add-transient-hook! 'package-install (package-refresh-contents)))


;;
;;; Custom hooks

(defcustom doom-before-init-hook ()
  "A hook run after Doom's core has initialized; before user configuration.

This is triggered right before $DOOMDIR/init.el is loaded, in the context of
early-init.el. Use this for configuration at the latest opportunity before the
session becomes unpredictably complicated by user config, packages, etc. This
runs in both interactive and non-interactive contexts, so guard hooks
appropriately against `noninteractive' or the `cli' context (see
`doom-context').

In contrast, `before-init-hook' is run just after $DOOMDIR/init.el is loaded,
but long before your modules and $DOOMDIR/config.el are loaded."
  :group 'doom
  :type 'hook)

(defcustom doom-after-init-hook ()
  "A hook run once Doom's core and modules, and the user's config are loaded.

This triggers at the absolute latest point in the eager startup process, and
runs in both interactive and non-interactive sessions, so guard hooks
appropriately against `noninteractive' or the `cli' context."
  :group 'doom
  :type 'hook)

(defcustom doom-before-modules-init-hook nil
  "Hooks run before module init.el files are loaded."
  :group 'doom
  :type 'hook)

(defcustom doom-after-modules-init-hook nil
  "Hooks run after module init.el files are loaded."
  :group 'doom
  :type 'hook)

(defcustom doom-before-modules-config-hook nil
  "Hooks run before module config.el files are loaded."
  :group 'doom
  :type 'hook)

(defcustom doom-after-modules-config-hook nil
  "Hooks run after module config.el files are loaded (but before the user's)."
  :group 'doom
  :type 'hook)

;;; Initializers
(provide 'doom)
;;; doom.el ends here
