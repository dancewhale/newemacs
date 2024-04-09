(straight-use-package 'general)
(require 'general)

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

(straight-use-package 'hydra)
(straight-use-package
 '(org-fc
   :type git :host nil :repo "https://git.sr.ht/~l3kn/org-fc"
   :files (:defaults "awk" "demo.org")
   :custom (org-fc-directories '("~/org/"))
   :config
   (require 'org-fc-hydra)))

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
(which-key-mode)

(straight-use-package 'vertico)
(setq vertico-cycle t)
(vertico-mode)

(winner-mode t)

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
	   rime-posframe-properties (list :internal-border-width 1
					  :font lewis-fixed-font
					  )
	   rime-user-data-dir "~/Documents/rime/"
	   rime-inline-ascii-trigger 'shift-r
	   ))
  (when (eq system-type 'darwin)
    (setq
     ;; rime-emacs-module-header-root "/Applications/Emacs.app/Contents/Resources/include/" ;; use build-emacs
     rime-emacs-module-header-root "/opt/homebrew/opt/emacs-plus@30/include" ;;use emacs-plus
     rime-librime-root "~/Downloads/librime/dist"
     ))

(straight-use-package 'magit)
(require 'magit)

(defun cao-emacs-magit ()
  (interactive)
  (magit-status-setup-buffer "~/.emacs.d"))


(general-define-key  :prefix "s-e"
      "s-e g"    #'cao-emacs-magit)

(straight-use-package 'helpful)
;; Note that the built-in `describe-function' includes both functions
;; and macros. `helpful-function' is functions only, so we provide
;; `helpful-callable' as a drop-in replacement.
(global-set-key (kbd "C-h f") #'helpful-callable)

(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)

;; Lookup the current symbol at point. C-c C-d is a common keybinding
;; for this in lisp modes.
(global-set-key (kbd "C-c C-d") #'helpful-at-point)

;; Look up *F*unctions (excludes macros).
;;
;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
;; already links to the manual, if a function is referenced there.
(global-set-key (kbd "C-h F") #'helpful-function)
