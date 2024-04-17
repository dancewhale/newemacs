;; -------->>  [[file:init.org::global][global]]
(straight-use-package 'general)
(require 'general)
(general-define-key 
    "s-f s-f"    'View-scroll-half-page-forward
    "s-f s-b"    'View-scroll-half-page-backward
    "C-c l"      'org-store-link
)
;; --------<<  global ends here



;; -------->>  [[file:init.org::vundo][vundo]]
(straight-use-package 'vundo)
;; --------<<  vundo ends here



;; -------->>  [[file:init.org::undo-tree][undo-tree]]
(straight-use-package 'undo-tree)
;; --------<<  undo-tree ends here



;; -------->>  [[file:init.org::undo-fu][undo-fu]]
(straight-use-package 'undo-fu)
;; --------<<  undo-fu ends here



;; -------->>  [[file:init.org::dash][dash]]
(straight-use-package 'dash)
;; --------<<  dash ends here



;; -------->>  [[file:init.org::s][s]]
(straight-use-package 's)
;; --------<<  s ends here



;; -------->>  [[file:init.org::f][f]]
(straight-use-package 'f)
;; --------<<  f ends here



;; -------->>  [[file:init.org::use-package][use-package]]
(straight-use-package 'use-package)
;; --------<<  use-package ends here



;; -------->>  [[file:init.org::evil][evil]]
(straight-use-package 'evil)
(straight-use-package 'goto-chg)
(require 'evil)
(evil-mode 1)
;; --------<<  evil ends here



;; -------->>  [[file:init.org::evil-collection][evil-collection]]
(straight-use-package 'evil-collection)

(setq evil-want-integration t)
(setq evil-want-keybinding nil)

(when (require 'evil-collection nil t)
(evil-collection-init))
;; --------<<  evil-collection ends here



;; -------->>  [[file:init.org::org-evil][org-evil]]
(straight-use-package '(org-evil :build (:not compile)))
(require 'org-evil)
;; --------<<  org-evil ends here



;; -------->>  [[file:init.org::evil-surround][evil-surround]]
(straight-use-package 'evil-surround)
(global-evil-surround-mode 1 )
;; --------<<  evil-surround ends here



;; -------->>  [[file:init.org::which-key][which-key]]
(straight-use-package 'which-key)
(require 'which-key)
;;(setq which-key-idle-delay 0.1)
(which-key-mode)
;; --------<<  which-key ends here



;; -------->>  [[file:init.org::*hydra][hydra:1]]
(straight-use-package 'hydra)
(require 'hydra)
;; --------<<  hydra:1 ends here



;; -------->>  [[file:init.org::ef-themes][ef-themes]]
(straight-use-package 'ef-themes)
(require 'ef-themes)
(load-theme 'ef-light t)
;; --------<<  ef-themes ends here



;; -------->>  [[file:init.org::basic-style][basic-style]]
(setq org-auto-align-tags nil
        org-tags-column 0
        org-ellipsis "⤵"
        org-hide-emphasis-markers t
        org-pretty-entities nil ;; can perfor ui such as "a_words" into small "awords"
        org-habit-graph-column 50
        ;; Agenda styling
        org-agenda-tags-column 0
        )
;; --------<<  basic-style ends here



;; -------->>  [[file:init.org::org-appear][org-appear]]
(straight-use-package '(org-appear :type git :host github :repo "awth13/org-appear"))
(add-hook 'org-mode-hook 'org-appear-mode)
;; --------<<  org-appear ends here



;; -------->>  [[file:init.org::org-modern][org-modern]]
(straight-use-package 'org-modern)
(with-eval-after-load 'org (global-org-modern-mode))
;; --------<<  org-modern ends here



;; -------->>  [[file:init.org::roam enable][roam enable]]
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
;; --------<<  roam enable ends here



;; -------->>  [[file:init.org::org-journal enable][org-journal enable]]
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
;; --------<<  org-journal enable ends here



;; -------->>  [[file:init.org::babel][babel]]
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
;; --------<<  babel ends here



;; -------->>  [[file:init.org::org-fc][org-fc]]
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
;; --------<<  org-fc ends here



;; -------->>  [[file:init.org::winner-mode][winner-mode]]
(winner-mode t)
;; --------<<  winner-mode ends here



;; -------->>  [[file:init.org::ace-window][ace-window]]
(straight-use-package 'ace-window)

(general-define-key
 "C-x o"  #'ace-window
 "s-o"    #'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
      aw-scope 'frame)
;; --------<<  ace-window ends here



;; -------->>  [[file:init.org::vertico][vertico]]
;  (straight-use-package 'vertico)
;  (setq vertico-cycle t)
;  (vertico-mode)
;; --------<<  vertico ends here



;; -------->>  [[file:init.org::pacakge install][pacakge install]]
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
;; --------<<  pacakge install ends here



;; -------->>  [[file:init.org::yasnippet][yasnippet]]
(straight-use-package 'yasnippet)
(setq yas-snippet-dirs (list "~/.emacs.d/snippets"))
(yas-global-mode)
;; --------<<  yasnippet ends here



;; -------->>  [[file:init.org::posframe][posframe]]
(straight-use-package 'posframe)
  (require 'posframe)
;; --------<<  posframe ends here



;; -------->>  [[file:init.org::rime 配置][rime 配置]]
(straight-use-package 'rime)
(setq default-input-method "rime")
  (with-eval-after-load 'rime
  (setq rime-disable-predicates '(   rime-predicate-prog-in-code-p
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
;; --------<<  rime 配置 ends here



;; -------->>  [[file:init.org::rime 扩展函数][rime 扩展函数]]
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
;; --------<<  rime 扩展函数 ends here



;; -------->>  [[file:init.org::magit][magit]]
(straight-use-package 'magit)
(require 'magit)

(defun cao-emacs-magit ()
  (interactive)
  (magit-status-setup-buffer "~/.emacs.d"))


(general-define-key  :prefix "s-e"
      "g"      '(:ignore t  :which-key "magit prefix")
      "g l"    #'magit
      "g g"    #'cao-emacs-magit)
;; --------<<  magit ends here



;; -------->>  [[file:init.org::helpful][helpful]]
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
;; --------<<  helpful ends here



;; -------->>  [[file:init.org::go-mode][go-mode]]
(straight-use-package 'go-mode)
;; --------<<  go-mode ends here



;; -------->>  [[file:init.org::lsp-mode][lsp-mode]]
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
;; --------<<  lsp-mode ends here



;; -------->>  [[file:init.org::lsp-ui][lsp-ui]]
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
;; --------<<  lsp-ui ends here



;; -------->>  [[file:init.org::lsp-ivy][lsp-ivy]]
(use-package lsp-ivy :straight t :commands lsp-ivy-workspace-symbol)
;; --------<<  lsp-ivy ends here



;; -------->>  [[file:init.org::lsp-treemacs][lsp-treemacs]]
(use-package lsp-treemacs :straight t :commands lsp-treemacs-errors-list)
;; --------<<  lsp-treemacs ends here



;; -------->>  [[file:init.org::dap-mode][dap-mode]]
(use-package dap-mode :straight t)
;; --------<<  dap-mode ends here



;; -------->>  [[file:init.org::flycheck][flycheck]]
(straight-use-package 'flycheck)
(global-flycheck-mode 1 )
;; --------<<  flycheck ends here



;; -------->>  [[file:init.org::better-jumper][better-jumper]]
(straight-use-package 'better-jumper)
(require 'better-jumper)
(better-jumper-mode +1)
(general-define-key
 "C-o"    'better-jumper-jump-backward
 "C-i"    'better-jumper-jump-forward)
;; --------<<  better-jumper ends here



;; -------->>  [[file:init.org::vterm][vterm]]
(straight-use-package 'vterm)
      (straight-use-package 'vterm-toggle)

      (require 'vterm)
      (require 'vterm-toggle)

      (setq vterm-toggle-hide-method 'reset-window-configration)

    (setq vterm-toggle-fullscreen-p 't)

    (evil-set-initial-state 'vterm-mode 'emacs)

    (setq-default vterm-keymap-exceptions '("C-c" "C-x" "C-u" "C-g" "C-h" "M-x" "M-o" "C-y"  "M-y"))
    (setq-default vterm-max-scrollback (- 20000 42))
    (setq-default vterm-min-window-width 10)
    (setq-default vterm-copy-mode-remove-fake-newlines t)
    (setq-default vterm-enable-manipulate-selection-data-by-osc52 t)
    (setq-default vterm-module-cmake-args " -DUSE_SYSTEM_LIBVTERM=yes ")
    (setq vterm-toggle-cd-auto-create-buffer t)
    (setq-default vterm-clear-scrollback-when-clearing t)
    (setq-default term-prompt-regexp "^[^#$%>\n]*[#$%>] *") ;默认 regex 相当于没定义，term-bol 无法正常中转到开头处
    (setq vterm-buffer-name-string "*vterm* %s")


    (add-hook 'vterm-toggle-show-hook #'evil-insert-state)
    (add-hook 'vterm-toggle-hide-hook #'evil-normal-state)
    (setq vterm-toggle-reset-window-configration-after-exit 'kill-window-only)
    ;; (setq vterm-toggle-hide-method 'bury-all-vterm-buffer)
    ;; 使用 swith-to-buffer 来 hide vterm,以确保使用共同的 window,与 tabline 更好的兼容
    ;; 主要是维护 buffer-list,以确保下次切回来，仍是最近使用的 vterm
    ;; 我个人没有使用tabline
    ;; (add-hook 'vterm-toggle-hide-hook #'(lambda() (switch-to-buffer (current-buffer))))
    ;; (setq vterm-toggle-hide-method nil)


    (defun vterm-ctrl-g ()
      "vterm ctrl-g"
      (interactive)
      (if (save-excursion (goto-char (point-at-bol))(search-forward-regexp "filter>" nil t))
          (if (equal last-command 'vterm-ctrl-g)
    	  (evil-normal-state)
    	(call-interactively 'vmacs-vterm-self-insert))
        (if (equal last-command 'vterm-copy-mode)
    	(call-interactively 'vmacs-vterm-self-insert)
          (if (equal last-command 'evil-normal-state)
    	  (progn
    	    (vterm-copy-mode 1)
    	    (setq this-command 'vterm-copy-mode)
    	    )
    	(setq this-command 'evil-normal-state)
    	(evil-normal-state)))))


    (defun vmacs-vterm-kill-line()
      (interactive)
      (let ((succ (vterm-goto-char (point)))
    	(beg (point))
    	(end (vterm--get-end-of-line)))
        (save-excursion
          (goto-char end)
          (when (looking-back "[ \t\n]+" beg t)
    	(setq end (match-beginning 0)))
          (when (> end beg) (kill-ring-save beg end)))
        (vterm-send-key "k" nil nil :ctrl)))

    (defun vmacs-vterm-self-insert()
      (interactive)
      (unless (evil-insert-state-p)
        (evil-insert-state))
      (call-interactively 'vterm--self-insert))

    (defun vmacs-vterm-enable-output()
      (when (member major-mode '(vterm-mode))
        (vterm-copy-mode -1)))

    (defun vmacs-vterm-copy-mode-hook()
      (if vterm-copy-mode
          (progn
    	(message "vterm-copy-mode enabled")
    	(unless (evil-normal-state-p)
    	  (evil-normal-state)))
        (unless (evil-insert-state-p)
          (evil-insert-state))))

    (add-hook 'vterm-copy-mode-hook #'vmacs-vterm-copy-mode-hook)
    (add-hook 'evil-insert-state-entry-hook 'vmacs-vterm-enable-output)

    (defun vterm-eob()
      (interactive)
      (goto-char (point-max))
      (skip-chars-backward "\n[:space:]"))

    (evil-define-operator evil-vterm-delete-char (beg end type register)
      "Delete previous character."
      :motion evil-forward-char
      (interactive "<R><x>")
      (evil-collection-vterm-delete beg end type register))


    (defun vmacs-vterm-hook()
      (evil-define-key 'insert 'local   (kbd "<escape>") 'vterm--self-insert)
      (let ((p (get-buffer-process (current-buffer))))
        (when p (set-process-query-on-exit-flag p nil))))

    (add-hook 'vterm-mode-hook 'vmacs-vterm-hook)



    (defun vterm-toggle-after-ssh-login (method user host port localdir)
      (when (string-equal "docker" method)
        (vterm-send-string "bash")
        (vterm-send-return))
      (when (member host '("BJ-DEV-GO" "dev.com"))
        (vterm-send-string "zsh")
        (vterm-send-return)
        (vterm-send-string "j;clear" )
        (vterm-send-return)))

    (add-hook 'vterm-toggle-after-remote-login-function 'vterm-toggle-after-ssh-login)

    (defun vterm-edit-command-action ()
      (interactive)
      (let* ((delete-trailing-lines t)
    	 (vtermbuf (current-buffer))
    	 (begin (vterm--get-prompt-point))
    	 (buffer (get-buffer-create "vterm-edit-command"))
    	 (n (length (filter-buffer-substring begin (point))))
    	 foreground
    	 (content (filter-buffer-substring
    		   begin (point-max))))
        (with-current-buffer buffer
          (setq vterm-edit-vterm-buffer vtermbuf)
          (erase-buffer)
          (insert content)
          (delete-trailing-whitespace)
          (goto-char (1+ n))
          ;; delete zsh auto-suggest candidates
          (setq foreground (plist-get (get-text-property (point) 'font-lock-face) :foreground ))
          (when (equal foreground  (face-background 'vterm-color-black nil 'default))
    	(delete-region (point) (point-max)))
          (sh-mode)
          (vterm-edit-command-mode)
          (evil-insert-state)
          (setq-local header-line-format
    		  (substitute-command-keys
    		   (concat "Edit, then "
    			   (mapconcat
    			    'identity
    			    (list "\\[vterm-edit-command-commit]: Finish"
    				  "\\[vterm-edit-command-abort]: Abort"
    				  )
    			    ", "))))
          (split-window-sensibly)
          (switch-to-buffer-other-window buffer)))
      )

    (defun vterm-edit-command-commit ()
      (interactive)
      (let ((delete-trailing-lines t)
    	content)
        (delete-trailing-whitespace)
        (goto-char (point-max))
        (when (looking-back "\n") (backward-delete-char 1))
        (setq content (buffer-string))
        (with-current-buffer vterm-edit-vterm-buffer
          (vterm-send-key "a" nil nil t)
          (vterm-send-key "k" nil nil t t)
          (unless (vterm--at-prompt-p)
    	(vterm-send-key "c" nil nil t))
          (vterm-send-string content)))
      (vterm-edit-command-abort))

    (defun vterm-edit-command-abort ()
      (interactive)
      (kill-buffer-and-window))

    (defvar vterm-edit-command-mode-map
      (let ((keymap (make-sparse-keymap)))
        (define-key keymap (kbd "C-c C-c") #'vterm-edit-command-commit)
        (define-key keymap (kbd "C-c C-k") #'vterm-edit-command-abort)
        keymap))

    (define-minor-mode vterm-edit-command-mode
      "Vterm Edit Command Mode")


  (general-define-key
      :prefix "s-e"
      "i"      '(vterm-toggle :which-key "toggle vterm")
  )
    
(general-define-key
    :keymaps 'vterm-mode-map
    :states '(normal insert)
    "G"      '(vtermeob :which-key "go to end of buffer")
    "C-l"    '(vterm-clear :which-key "clear term")
    "C-g"    '(vterm-ctrl-g :which-key "ctrl-g quit")
    "C-\\"   '(toggle-input-method :which-key "toggle input method")
    "C-/"    '(vterm-undo :which-key "vterm undo")
)

(general-define-key
    :keymaps 'vterm-mode-map
    :states 'emacs
    "C-c C-e"  '(compilation-shell-minor-mode  :which-key "vterm shell")
    "C-q"      '(vterm-send-next-key	      :which-key "vterm send key")
    "C-g"      '(vterm-ctrl-g		      :which-key "vterm ctrl-g")
    "C-l"      '(vterm-clear		      :which-key "vterm clear")
    "C-y"      '(vterm-yank		      :which-key "vterm yank")
    "C-k"      '(vmacs-vterm-kill-line	      :which-key "vterm kill")
    "C-p"      '(vmacs-vterm-self-insert	      :which-key "vterm precise cmd")
    "C-n"      '(vmacs-vterm-self-insert	      :which-key "vterm next cmd")
    "C-r"      '(vmacs-vterm-self-insert	      :which-key "vterm cmd  search")
    "C-\\"     '(toggle-input-method	      :which-key "vterm input method")
    "C-x C-e"  '(vterm-edit-command-action     :which-key "vterm edit action")
    "C-x e"    '(vterm-edit-command-action     :which-key "vterm edit action")
    "C-/"      '(vterm-undo		      :which-key "vterm undo")

)
;; --------<<  vterm ends here



;; -------->>  [[file:init.org::curx][curx]]
(straight-use-package 'crux)
;; --------<<  curx ends here



;; -------->>  [[file:init.org::curx][curx]]
(load-file "~/.emacs.d/private.el")
;; --------<<  curx ends here


