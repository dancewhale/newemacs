(straight-use-package 'general)
(require 'general)
(general-define-key 
    "s-f s-f"    #'View-scroll-half-page-forward
    "s-f s-b"    #'View-scroll-half-page-backward)

(straight-use-package 'use-package)

(straight-use-package 'meow)
(require 'meow)
(meow-global-mode 1)
(setq meow-use-keypad-when-execute-kbd nil
	meow-expand-exclude-mode-list nil
	meow-use-clipboard t
	;; meow-cursor-type-normal 'box
	;; meow-cursor-type-insert '(bar . 1)
	meow-replace-state-name-list '((normal . "N")
				       (motion . "M")
				       (keypad . "K")
					 (insert . "I")
					 (beacon . "B"))
	  meow-use-enhanced-selection-effect t
	  meow-cheatsheet-layout meow-cheatsheet-layout-qwerty
	  meow-keypad-start-keys '((?c . ?c)
				   (?x . ?x))
	  meow-char-thing-table '((?\( . round)
				  (?\) . round)
				  (?\[ . square)
				  (?\] . square)
				  (?\{ . curly)
				  (?\} . curly)
				  (?\" . string)
				  (?w . symbol)
				  ;; (?w . window)
				  (?b . buffer)
				  (?p . paragraph)
				  (?l . line)
				  (?d . defun)
				  (?s . sentence))
	  )
  ;; motion keys
  (meow-motion-overwrite-define-key '("j" . meow-next)
				      '("k" . meow-prev)
				      '("h" . meow-left)
				      '("l" . meow-right)
				      '("<escape>" . ignore)
				      '("." . repeat))
  ;; normal keys
  (meow-normal-define-key '("0" . meow-expand-0)
			    '("9" . meow-expand-9)
			    '("8" . meow-expand-8)
			    '("7" . meow-expand-7)
			    '("6" . meow-expand-6)
			    '("5" . meow-expand-5)
			    '("4" . meow-expand-4)
			    '("3" . meow-expand-3)
			    '("2" . meow-expand-2)
			    '("1" . meow-expand-1)

			    '("a" . meow-vim-append)
			    ;; '("A" . meow-append-vim)
			    '("b" . meow-back-word)
			    '("B" . meow-back-symbol)
			    '("c c" . meow-change)
			    '("d" . meow-kill)
			    '("e" . meow-next-word)
			    '("E" . meow-next-symbol)
			    '("f" . meow-find)
			    '("g" . g-extra-commands)
			    '("G" . meow-grab)
			    '("h" . meow-left)
			    '("H" . meow-left-expand)
			    '("i" . meow-insert)
			    ;; '("I" . meow-insert-vim)
			    '("j" . meow-next)
			    '("J" . meow-next-expand)
			    '("k" . meow-prev)
			    '("K" . meow-prev-expand)
			    '("l" . meow-right)
			    '("L" . meow-right-expand)
			    '("m" . consult-register-store)
			    '("M" . meow-block)
			    '("n" . meow-search)
			    '("N" . meow-pop-selection);;

			    '("o" . meow-open-below)
			    '("O" . meow-open-above)
			    '("p" . meow-yank)
			    '("P" . meow-yank-pop);;
			    '("q" . meow-quit)
			    '("Q" . consult-goto-line)
			    '("r" . meow-replace)
			    '("R" . meow-swap-grab)
			    '("s" . meow-line)
			    '("S" . meow-kmacro-lines) ;;
			    '("t" . meow-till)
			    '("u" . meow-undo)
			    '("U" . vundo)
			    '("v v" . meow-visit) ;;
			    '("V" . meow-kmacro-matches) ;;
			    '("w" . meow-mark-word)
			    '("W" . meow-mark-symbol)

			    '("x" . meow-delete)
			    '("X" . meow-backward-delete)
			    '("y" . meow-save)
			    ;; '("Y" . meow-sync-save)
			    '("z a" . hs-toggle-hiding)
			    '("z c" . hs-hide-block)
			    '("z o" . hs-show-block)
			    '("z m" . hs-hide-all)
			    '("z r" . hs-show-all)
			    '("z z" . recenter-top-bottom)

			    '("v i" . meow-inner-of-thing)
			    '("v a" . meow-bounds-of-thing)
			    '("v =" . insert-equation)

			    '("-" . negative-argument)
			    '("=" . indent-region)
			    '("[" . meow-beginning-of-thing)
			    '("]" . meow-end-of-thing)
			    '("\\" . quoted-insert)
			    '(";" . meow-expand-1)
			    ;; '(":" . async-shell-command)
			    '("'" . consult-register-load)
			    '("," . meow-reverse)
			    '("." . repeat)

			    '("<escape>" . ignore)
			    '("!" . meow-start-kmacro-or-insert-counter)
			    '("@" . meow-end-or-call-kmacro)
			    '("#" . embark-toggle-highlight)
			    '("^" . meow-join)
			    '("*" . embark-next-symbol)
			    '("/" . isearch-forward))
  (defun meow-vim-append ()
    "Like vim, move to the end of selection, switch to INSERT state."
    (interactive)
    (if meow--temp-normal
	  (progn
	    (message "Quit temporary normal mode")
	    (meow--switch-state 'motion))
	(if (not (region-active-p))
	    (progn
	      (when (and meow-use-cursor-position-hack
			 (< (point) (point-max)))
		(forward-char 1))
	      (forward-char 1)
	      )
	  (meow--direction-forward)
	  (meow--cancel-selection))
	(meow--switch-state 'insert)))

  (defun toggle-between-meow-normal-motion()
    (interactive)
    (if meow-motion-mode (meow-normal-mode) (meow-motion-mode)))
  (global-set-key (kbd "M-\\") #'toggle-between-meow-normal-motion)

(straight-use-package 'which-key)
(require 'which-key)
(setq which-key-idle-delay 0.1)
(which-key-mode)

(straight-use-package 'hydra)
(require 'hydra)

(straight-use-package 'ef-themes)
(require 'ef-themes)
(load-theme 'ef-light t)

(setq org-auto-align-tags nil
        org-tags-column 0
        org-ellipsis "⤵"
        org-hide-emphasis-markers t
        org-pretty-entities nil ;; can perfor ui such as "a_words" into small "awords"
        org-habit-graph-column 50
        ;; Agenda styling
        org-agenda-tags-column 0
        )

(straight-use-package '(org-appear :type git :host github :repo "awth13/org-appear"))
(add-hook 'org-mode-hook 'org-appear-mode)

(straight-use-package 'org-modern)
(with-eval-after-load 'org (global-org-modern-mode))

(straight-use-package 'org-roam)
(require 'org-roam)
(require 'org-roam-dailies)
(setq roam_path (file-truename "~/Dropbox/roam"))
(setq journal_path (file-truename "~/Dropbox/roam/daily"))
(setq worklog_path (file-truename "~/Dropbox/worklog"))
(setq org-roam-db-location (file-truename "~/Dropbox/roam/.org-roam.db"))
(setq org-roam-directory roam_path)
(setq org-roam-file-extensions '("org" "md"))
(setq org-roam-dailies-directory "daily")
(setq find-file-visit-truename t)
(setq org-roam-mode-sections
	(list #'org-roam-backlinks-section
	      ;; #'org-roam-reflinks-section
	      #'org-roam-unlinked-references-section
	      ))
(general-define-key 
    "s-e n l"    #'org-roam-buffer-toggle
    "s-e n f"    #'org-roam-node-find
    "s-e n i"    #'org-roam-node-insert
    "s-e d c"    #'org-roam-dailies-capture-today
    "s-e d d"    #'org-roam-dailies-goto-date
    "s-e d n"    #'org-roam-dailies-goto-next-note
    "s-e d p"    #'org-roam-dailies-goto-previous-note
    )

(straight-use-package 'org-journal)
(require 'org-journal)
;; Org Journal config
(setq org-journal-dir worklog_path)
;; (setq org-journal-file-type 'weekly)
(setq org-journal-file-type 'monthly)
(setq org-journal-file-format "%Y-%m-%d.org")
(setq org-journal-date-format "%A, %x")
(setq org-journal-date-prefix "* ")
(setq org-journal-encrypt-journal nil)
(setq org-journal-enable-cache t)

;; change org-level-2 color.
(add-hook 'org-journal-mode-hook
  (lambda ()
    (face-remap-add-relative 'org-level-2 '(:foreground "white" :weight 'normal))))

(setq org-journal-file-header 'org-journal-file-header-func)

(general-define-key 
  "s-e j n"    #'org-journal-new-entry)

(defun edit-src-block (src fn language)
  "Replace SRC org-element's value property with the result of FN.
  FN is a function that operates on org-element's value and returns a string.
  LANGUAGE is a string referring to one of orb-babel's supported languages.
  (https://orgmode.org/manual/Languages.html#Languages)"
  (let ((src-language (org-element-property :language src))
        (value (org-element-property :value src)))
    (when (string= src-language language)
      (let ((copy (org-element-copy src)))
        (org-element-put-property copy :value
                                  (funcall fn value))
        (org-element-set-element src copy)))))

(defun format-elisp-string (string)
  "Indents elisp buffer string and reformats dangling parens."
  (with-temp-buffer
    (let ((inhibit-message t))
        (emacs-lisp-mode)
        (insert 
         (replace-regexp-in-string "[[:space:]]*
  [[:space:]]*)" ")" string))
        (indent-region (point-min) (point-max))
        (buffer-substring (point-min) (point-max)))))

  (defun format-elisp-src-blocks ()
    "Format Elisp src blocks in the current org buffer"
    (interactive)
    (save-mark-and-excursion
      (let ((AST (org-element-parse-buffer)))
        (org-element-map AST 'src-block
          (lambda (element) 
            (edit-src-block element #'format-elisp-string "emacs-lisp")))
        (delete-region (point-min) (point-max))
        (insert (org-element-interpret-data AST)))))

(straight-use-package
   '(org-fc
     :type git :host github :repo "l3kn/org-fc"
     :files (:defaults "awk" "demo.org")
     :branch "develop" :build (:not compile)))

  (require 'org-fc-hydra)
  (require 'org-fc)
  (setq org-fc-directories '("~/Dropbox/roam/"))
  (setq org-fc-algo-fsrs-history-file "~/Dropbox/roam/.org-fc-reviews-fsrs.tsv")
  (setq org-fc-algo-sm2-history-file "~/Dropbox/roam/.org-fc-reviews-sm2.tsv")

(general-define-key
 :definer 'minor-mode
 :states 'normal
 :keymaps 'org-fc-review-flip-mode
 "RET" 'org-fc-review-flip
 "n" 'org-fc-review-flip
 "s" 'org-fc-review-suspend-card
 "q" 'org-fc-review-quit)

(general-define-key
 :definer 'minor-mode
 :states 'normal
 :keymaps 'org-fc-review-rate-mode
 "a" 'org-fc-review-rate-again
 "h" 'org-fc-review-rate-hard
 "g" 'org-fc-review-rate-good
 "e" 'org-fc-review-rate-easy
 "s" 'org-fc-review-suspend-card
 "q" 'org-fc-review-quit)

(winner-mode t)

(straight-use-package 'ace-window)

(general-define-key
 "C-x o"  #'ace-window
 "s-o"    #'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
      aw-scope 'frame)

;  (straight-use-package 'vertico)
;  (setq vertico-cycle t)
;  (vertico-mode)

(straight-use-package 'ivy)
 (straight-use-package 'swiper)
 (straight-use-package 'ivy-hydra)
 (straight-use-package 'ivy-avy)
 (straight-use-package 'counsel)
 (straight-use-package 'ivy-rich)
 (straight-use-package 'ivy-prescient)
 (straight-use-package 'wgrep)
 (straight-use-package 'ivy-posframe)
 (straight-use-package 'nerd-icons-ivy-rich)

(ivy-mode)
(ivy-prescient-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(general-define-key
"M-x"     'counsel-M-x
"s-x"     'counsel-M-x
"C-x C-f" 'counsel-find-file
"C-c C-o" 'ivy-occur
"C-s"     'swiper
"C-c C-r" 'ivy-resume
"C-c g"   'counsel-git
"C-c j"   'counsel-git-grep
"C-c k"   'counsel-ag
"C-x l"   'counsel-locate
"C-S-o"   'counsel-rhythmbox
)

(straight-use-package 'yasnippet)
(setq yas-snippet-dirs (list "~/.emacs.d/snippets"))
(yas-global-mode)

(straight-use-package 'posframe)
  (require 'posframe)

(straight-use-package 'rime)
(setq default-input-method "rime")
  (with-eval-after-load 'rime
  (setq rime-disable-predicates '(meow-normal-mode-p
				     meow-motion-mode-p
				     meow-keypad-mode-p
				     rime-predicate-prog-in-code-p
				     rime-predicate-punctuation-line-begin-p ;;在行首要输入符号时
				     rime-predicate-after-alphabet-char-p ;;在英文字符串之后（必须为以字母开头的英文字符串）
				     rime-predicate-current-input-punctuation-p ;;当要输入的是符号时
				     ;; rime-predicate-after-ascii-char-p ;;任意英文字符后 ,enable this to use with <s
				     rime-predicate-current-uppercase-letter-p ;; 将要输入的为大写字母时
				     rime-predicate-space-after-cc-p ;;在中文字符且有空格之后
				     )
	   rime-show-candidate 'posframe
	   rime-posframe-properties (list :internal-border-width 1)
	   rime-user-data-dir "~/Dropbox/rimeSync/"
	   rime-share-data-dir "~/.local/share/rime/ice"
	   rime-inline-ascii-trigger 'shift-r
	   ))
  (when (eq system-type 'darwin)
    (setq
     ;; rime-emacs-module-header-root "/Applications/Emacs.app/Contents/Resources/include/" ;; use build-emacs
     rime-emacs-module-header-root "/opt/homebrew/opt/emacs-plus@30/include" ;;use emacs-plus
     rime-librime-root "~/Downloads/librime/dist"
     ))

(setq rime-translate-keybindings
  	'("C-f" "C-b" "C-n" "C-p" "C-g" "C-h" "<left>" "<tab>" "C-<tab>" "C-d"
  	  "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>" "C-e" "C-a"))


    (defun +rime-force-enable ()
      "[ENHANCED] Force into Chinese input state.
  If current input method is not `rime', active it first. If it is
  currently in the `evil' non-editable state, then switch to
  `evil-insert-state'."
      (interactive)
      (let ((input-method "rime"))
        (unless (string= current-input-method input-method)
  	(activate-input-method input-method))
        (when (rime-predicate-evil-mode-p)
  	(if (= (1+ (point)) (line-end-position))
  	    (evil-append 1)
  	  (evil-insert 1)))
        (rime-force-enable)))

    (defun +rime-convert-string-at-point ()
      "Convert the string at point to Chinese using the current input scheme.
  First call `+rime-force-enable' to active the input method, and
  then search back from the current cursor for available string (if
  a string is selected, use it) as the input code, call the current
  input scheme to convert to Chinese."
      (interactive)
      (+rime-force-enable)
      (let ((string (if mark-active
  		      (buffer-substring-no-properties
  		       (region-beginning) (region-end))
  		    (buffer-substring-no-properties
  		     (point) (max (line-beginning-position) (- (point) 80)))))
  	  code
  	  length)
        (cond ((string-match "\\([a-z]+\\|[[:punct:]]\\)[[:blank:]]*$" string)
  	     (setq code (replace-regexp-in-string
  			 "^[-']" ""
  			 (match-string 0 string)))
  	     (setq length (length code))
  	     (setq code (replace-regexp-in-string " +" "" code))
  	     (if mark-active
  		 (delete-region (region-beginning) (region-end))
  	       (when (> length 0)
  		 (delete-char (- 0 length))))
  	     (when (> length 0)
  	       (setq unread-command-events
  		     (append (listify-key-sequence code)
  			     unread-command-events))))
  	    (t (message "`+rime-convert-string-at-point' did nothing.")))))

    (define-advice rime--posframe-display-content (:filter-args (args) resolve-posframe-issue-a)
      "给 `rime--posframe-display-content' 传入的字符串加一个全角空
  格，以解决 `posframe' 偶尔吃字的问题。"
      (cl-destructuring-bind (content) args
        (let ((newresult (if (string-blank-p content)
  			   content
  			 (concat content "　"))))
  	(list newresult))))

(general-define-key 
      "s-j"    #'+rime-convert-string-at-point)

(straight-use-package 'magit)
(require 'magit)

(defun cao-emacs-magit ()
  (interactive)
  (magit-status-setup-buffer "~/.emacs.d"))


(general-define-key  :prefix "s-e"
      "g"      '(:ignore t  :which-key "magit prefix")
      "g l"    #'magit
      "g g"    #'cao-emacs-magit)

(straight-use-package 'helpful)
;; Note that the built-in `describe-function' includes both functions
;; and macros. `helpful-function' is functions only, so we provide
;; `helpful-callable' as a drop-in replacement.
;; Lookup the current symbol at point. C-c C-d is a common keybinding
;; for this in lisp modes.
;; Look up *F*unctions (excludes macros).
;;
;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
;; already links to the manual, if a function is referenced there.
(general-define-key
 "C-h f"  #'helpful-callable
 "C-h v"  #'helpful-variable
 "C-h F"  #'helpful-function
 "C-h s"  #'helpful-symbol
 "C-h k"  #'helpful-key
 "C-h x"  #'helpful-command
 "C-h C-d"  #'helpful-at-point
 )

(straight-use-package 'go-mode)

(use-package lsp-mode :straight t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((go-mode . lsp)
   (python-mode . lsp)
   (js-mode . lsp)
   (json-mode . lsp)
   (yaml-mode . lsp)
   (dockrfile-mode . lsp)
   (shell-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  )

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode
  :ensure t
  :init (setq lsp-ui-doc-enable t
		lsp-ui-doc-include-signature t

		lsp-enable-snippet nil
		lsp-ui-sideline-enable nil
		lsp-ui-peek-enable nil

		lsp-ui-doc-position              'at-point
		lsp-ui-doc-header                nil
		lsp-ui-doc-border                "white"
		lsp-ui-doc-include-signature     t
		lsp-ui-sideline-update-mode      'point
		lsp-ui-sideline-delay            1
		lsp-ui-sideline-ignore-duplicate t
		lsp-ui-peek-always-show          t
		lsp-ui-flycheck-enable           nil
		)
  :bind (:map lsp-ui-mode-map
		([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
		([remap xref-find-references] . lsp-ui-peek-find-references)
		("C-c u" . lsp-ui-imenu))
  :config
  (setq lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ivy :straight t :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :straight t :commands lsp-treemacs-errors-list)

(use-package dap-mode :straight t)

(straight-use-package 'better-jumper)
(require 'better-jumper)
(better-jumper-mode +1)
(general-define-key
 "C-o"    'better-jumper-jump-backward
 "C-i"    'better-jumper-jump-forward)

(straight-use-package 'crux)

(load-file "~/.emacs.d/private.el")
