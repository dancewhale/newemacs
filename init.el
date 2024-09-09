;; -------->>  [[file:init.org::global][global]]
(straight-use-package 'general)
(require 'general)
(general-define-key 
    "s-f s-f"    'View-scroll-half-page-forward
    "s-f s-b"    'View-scroll-half-page-backward
    "C-c l"      'org-store-link
)

(general-define-key
  :keymaps 'ivy-minibuffer-map
    "C-w"  'evil-delete-backward-word)

(general-define-key
  :keymaps 'minibuffer-mode-map
    "C-w"  'evil-delete-backward-word)
;; --------<<  global ends here



;; -------->>  [[file:init.org::iterm-keysetting][iterm-keysetting]]
(define-key function-key-map "\e[27;5;39~" (kbd "C-'"))
(define-key function-key-map "\e[27;6;34~" (kbd "C-\""))
(define-key function-key-map "\e[27;3;39~" (kbd "M-'"))
(define-key function-key-map "\e[27;4;34~" (kbd "M-\""))
(define-key function-key-map "\e[27;9;39~" (kbd "s-'"))
(define-key function-key-map "\e[27;10;34~" (kbd "s-\""))
(define-key function-key-map "\e[27;7;39~" (kbd "C-M-'"))
(define-key function-key-map "\e[27;8;34~" (kbd "C-M-\""))
(define-key function-key-map "\e[27;5;45~" (kbd "C--"))
(define-key function-key-map "\e[27;6;95~" (kbd "C-_"))
(define-key function-key-map "\e[27;3;45~" (kbd "M--"))
(define-key function-key-map "\e[27;4;95~" (kbd "M-_"))
(define-key function-key-map "\e[27;9;45~" (kbd "s--"))
(define-key function-key-map "\e[27;10;95~" (kbd "s-_"))
(define-key function-key-map "\e[27;7;45~" (kbd "C-M--"))
(define-key function-key-map "\e[27;8;95~" (kbd "C-M-_"))
(define-key function-key-map "\e[27;5;44~" (kbd "C-,"))
(define-key function-key-map "\e[27;6;60~" (kbd "C-<"))
(define-key function-key-map "\e[27;3;44~" (kbd "M-,"))
(define-key function-key-map "\e[27;4;60~" (kbd "M-<"))
(define-key function-key-map "\e[27;9;44~" (kbd "s-,"))
(define-key function-key-map "\e[27;10;60~" (kbd "s-<"))
(define-key function-key-map "\e[27;7;44~" (kbd "C-M-,"))
(define-key function-key-map "\e[27;8;60~" (kbd "C-M-<"))
(define-key function-key-map "\e[27;5;47~" (kbd "C-/"))
(define-key function-key-map "\e[27;6;63~" (kbd "C-?"))
(define-key function-key-map "\e[27;3;47~" (kbd "M-/"))
(define-key function-key-map "\e[27;4;63~" (kbd "M-?"))
(define-key function-key-map "\e[27;9;47~" (kbd "s-/"))
(define-key function-key-map "\e[27;10;63~" (kbd "s-?"))
(define-key function-key-map "\e[27;7;47~" (kbd "C-M-/"))
(define-key function-key-map "\e[27;8;63~" (kbd "C-M-?"))
(define-key function-key-map "\e[27;5;46~" (kbd "C-."))
(define-key function-key-map "\e[27;6;62~" (kbd "C->"))
(define-key function-key-map "\e[27;3;46~" (kbd "M-."))
(define-key function-key-map "\e[27;4;62~" (kbd "M->"))
(define-key function-key-map "\e[27;9;46~" (kbd "s-."))
(define-key function-key-map "\e[27;10;62~" (kbd "s->"))
(define-key function-key-map "\e[27;7;46~" (kbd "C-M-."))
(define-key function-key-map "\e[27;8;62~" (kbd "C-M->"))
(define-key function-key-map "\e[27;5;49~" (kbd "C-1"))
(define-key function-key-map "\e[27;6;33~" (kbd "C-!"))
(define-key function-key-map "\e[27;3;49~" (kbd "M-1"))
(define-key function-key-map "\e[27;4;33~" (kbd "M-!"))
(define-key function-key-map "\e[27;9;49~" (kbd "s-1"))
(define-key function-key-map "\e[27;10;33~" (kbd "s-!"))
(define-key function-key-map "\e[27;7;49~" (kbd "C-M-1"))
(define-key function-key-map "\e[27;8;33~" (kbd "C-M-!"))
(define-key function-key-map "\e[27;5;48~" (kbd "C-0"))
(define-key function-key-map "\e[27;6;41~" (kbd "C-)"))
(define-key function-key-map "\e[27;3;48~" (kbd "M-0"))
(define-key function-key-map "\e[27;4;41~" (kbd "M-)"))
(define-key function-key-map "\e[27;9;48~" (kbd "s-0"))
(define-key function-key-map "\e[27;10;41~" (kbd "s-)"))
(define-key function-key-map "\e[27;7;48~" (kbd "C-M-0"))
(define-key function-key-map "\e[27;8;41~" (kbd "C-M-)"))
(define-key function-key-map "\e[27;5;51~" (kbd "C-3"))
(define-key function-key-map "\e[27;6;35~" (kbd "C-#"))
(define-key function-key-map "\e[27;3;51~" (kbd "M-3"))
(define-key function-key-map "\e[27;4;35~" (kbd "M-#"))
(define-key function-key-map "\e[27;9;51~" (kbd "s-3"))
(define-key function-key-map "\e[27;10;35~" (kbd "s-#"))
(define-key function-key-map "\e[27;7;51~" (kbd "C-M-3"))
(define-key function-key-map "\e[27;8;35~" (kbd "C-M-#"))
(define-key function-key-map "\e[27;5;50~" (kbd "C-2"))
(define-key function-key-map "\e[27;3;50~" (kbd "M-2"))
(define-key function-key-map "\e[27;4;64~" (kbd "M-@"))
(define-key function-key-map "\e[27;9;50~" (kbd "s-2"))
(define-key function-key-map "\e[27;10;64~" (kbd "s-@"))
(define-key function-key-map "\e[27;7;50~" (kbd "C-M-2"))
(define-key function-key-map "\e[27;8;64~" (kbd "C-M-@"))
(define-key function-key-map "\e[27;5;53~" (kbd "C-5"))
(define-key function-key-map "\e[27;6;37~" (kbd "C-%"))
(define-key function-key-map "\e[27;3;53~" (kbd "M-5"))
(define-key function-key-map "\e[27;4;37~" (kbd "M-%"))
(define-key function-key-map "\e[27;9;53~" (kbd "s-5"))
(define-key function-key-map "\e[27;10;37~" (kbd "s-%"))
(define-key function-key-map "\e[27;7;53~" (kbd "C-M-5"))
(define-key function-key-map "\e[27;8;37~" (kbd "C-M-%"))
(define-key function-key-map "\e[27;5;52~" (kbd "C-4"))
(define-key function-key-map "\e[27;6;36~" (kbd "C-$"))
(define-key function-key-map "\e[27;3;52~" (kbd "M-4"))
(define-key function-key-map "\e[27;4;36~" (kbd "M-$"))
(define-key function-key-map "\e[27;9;52~" (kbd "s-4"))
(define-key function-key-map "\e[27;10;36~" (kbd "s-$"))
(define-key function-key-map "\e[27;7;52~" (kbd "C-M-4"))
(define-key function-key-map "\e[27;8;36~" (kbd "C-M-$"))
(define-key function-key-map "\e[27;5;55~" (kbd "C-7"))
(define-key function-key-map "\e[27;6;38~" (kbd "C-&"))
(define-key function-key-map "\e[27;3;55~" (kbd "M-7"))
(define-key function-key-map "\e[27;4;38~" (kbd "M-&"))
(define-key function-key-map "\e[27;9;55~" (kbd "s-7"))
(define-key function-key-map "\e[27;10;38~" (kbd "s-&"))
(define-key function-key-map "\e[27;7;55~" (kbd "C-M-7"))
(define-key function-key-map "\e[27;8;38~" (kbd "C-M-&"))
(define-key function-key-map "\e[27;5;54~" (kbd "C-6"))
(define-key function-key-map "\e[27;6;94~" (kbd "C-^"))
(define-key function-key-map "\e[27;3;54~" (kbd "M-6"))
(define-key function-key-map "\e[27;4;94~" (kbd "M-^"))
(define-key function-key-map "\e[27;9;54~" (kbd "s-6"))
(define-key function-key-map "\e[27;10;94~" (kbd "s-^"))
(define-key function-key-map "\e[27;7;54~" (kbd "C-M-6"))
(define-key function-key-map "\e[27;8;94~" (kbd "C-M-^"))
(define-key function-key-map "\e[27;5;57~" (kbd "C-9"))
(define-key function-key-map "\e[27;6;40~" (kbd "C-("))
(define-key function-key-map "\e[27;3;57~" (kbd "M-9"))
(define-key function-key-map "\e[27;4;40~" (kbd "M-("))
(define-key function-key-map "\e[27;9;57~" (kbd "s-9"))
(define-key function-key-map "\e[27;10;40~" (kbd "s-("))
(define-key function-key-map "\e[27;7;57~" (kbd "C-M-9"))
(define-key function-key-map "\e[27;8;40~" (kbd "C-M-("))
(define-key function-key-map "\e[27;5;56~" (kbd "C-8"))
(define-key function-key-map "\e[27;6;42~" (kbd "C-*"))
(define-key function-key-map "\e[27;3;56~" (kbd "M-8"))
(define-key function-key-map "\e[27;4;42~" (kbd "M-*"))
(define-key function-key-map "\e[27;9;56~" (kbd "s-8"))
(define-key function-key-map "\e[27;10;42~" (kbd "s-*"))
(define-key function-key-map "\e[27;7;56~" (kbd "C-M-8"))
(define-key function-key-map "\e[27;8;42~" (kbd "C-M-*"))
(define-key function-key-map "\e[27;5;59~" (kbd "C-;"))
(define-key function-key-map "\e[27;6;58~" (kbd "C-:"))
(define-key function-key-map "\e[27;3;59~" (kbd "M-;"))
(define-key function-key-map "\e[27;4;58~" (kbd "M-:"))
(define-key function-key-map "\e[27;9;59~" (kbd "s-;"))
(define-key function-key-map "\e[27;10;58~" (kbd "s-:"))
(define-key function-key-map "\e[27;7;59~" (kbd "C-M-;"))
(define-key function-key-map "\e[27;8;58~" (kbd "C-M-:"))
(define-key function-key-map "\e[27;5;61~" (kbd "C-="))
(define-key function-key-map "\e[27;6;43~" (kbd "C-+"))
(define-key function-key-map "\e[27;3;61~" (kbd "M-="))
(define-key function-key-map "\e[27;4;43~" (kbd "M-+"))
(define-key function-key-map "\e[27;9;61~" (kbd "s-="))
(define-key function-key-map "\e[27;10;43~" (kbd "s-+"))
(define-key function-key-map "\e[27;7;61~" (kbd "C-M-="))
(define-key function-key-map "\e[27;8;43~" (kbd "C-M-+"))
(define-key function-key-map "\e[27;6;123~" (kbd "C-{"))
(define-key function-key-map "\e[27;3;91~" (kbd "M-["))
(define-key function-key-map "\e[27;4;123~" (kbd "M-{"))
(define-key function-key-map "\e[27;9;91~" (kbd "s-["))
(define-key function-key-map "\e[27;10;123~" (kbd "s-{"))
(define-key function-key-map "\e[27;7;91~" (kbd "C-M-["))
(define-key function-key-map "\e[27;8;123~" (kbd "C-M-{"))
(define-key function-key-map "\e[27;6;125~" (kbd "C-}"))
(define-key function-key-map "\e[27;3;93~" (kbd "M-]"))
(define-key function-key-map "\e[27;4;125~" (kbd "M-}"))
(define-key function-key-map "\e[27;9;93~" (kbd "s-]"))
(define-key function-key-map "\e[27;10;125~" (kbd "s-}"))
(define-key function-key-map "\e[27;7;93~" (kbd "C-M-]"))
(define-key function-key-map "\e[27;8;125~" (kbd "C-M-}"))
(define-key function-key-map "\e[27;6;124~" (kbd "C-|"))
(define-key function-key-map "\e[27;3;92~" (kbd "M-\\"))
(define-key function-key-map "\e[27;4;124~" (kbd "M-|"))
(define-key function-key-map "\e[27;9;92~" (kbd "s-\\"))
(define-key function-key-map "\e[27;10;124~" (kbd "s-|"))
(define-key function-key-map "\e[27;7;92~" (kbd "C-M-\\"))
(define-key function-key-map "\e[27;8;124~" (kbd "C-M-|"))
(define-key function-key-map "\e[27;6;65~" (kbd "C-S-A"))
(define-key function-key-map "\e[27;9;97~" (kbd "s-a"))
(define-key function-key-map "\e[27;10;65~" (kbd "s-S-A"))
(define-key function-key-map "\e[27;7;97~" (kbd "C-M-a"))
(define-key function-key-map "\e[27;8;65~" (kbd "C-M-S-A"))
(define-key function-key-map "\e[27;5;96~" (kbd "C-`"))
(define-key function-key-map "\e[27;6;126~" (kbd "C-~"))
(define-key function-key-map "\e[27;3;96~" (kbd "M-`"))
(define-key function-key-map "\e[27;4;126~" (kbd "M-~"))
(define-key function-key-map "\e[27;9;96~" (kbd "s-`"))
(define-key function-key-map "\e[27;10;126~" (kbd "s-~"))
(define-key function-key-map "\e[27;7;96~" (kbd "C-M-`"))
(define-key function-key-map "\e[27;8;126~" (kbd "C-M-~"))
(define-key function-key-map "\e[27;6;67~" (kbd "C-S-C"))
(define-key function-key-map "\e[27;9;99~" (kbd "s-c"))
(define-key function-key-map "\e[27;10;67~" (kbd "s-S-C"))
(define-key function-key-map "\e[27;7;99~" (kbd "C-M-c"))
(define-key function-key-map "\e[27;8;67~" (kbd "C-M-S-C"))
(define-key function-key-map "\e[27;6;66~" (kbd "C-S-B"))
(define-key function-key-map "\e[27;9;98~" (kbd "s-b"))
(define-key function-key-map "\e[27;10;66~" (kbd "s-S-B"))
(define-key function-key-map "\e[27;7;98~" (kbd "C-M-b"))
(define-key function-key-map "\e[27;8;66~" (kbd "C-M-S-B"))
(define-key function-key-map "\e[27;6;69~" (kbd "C-S-E"))
(define-key function-key-map "\e[27;9;101~" (kbd "s-e"))
(define-key function-key-map "\e[27;10;69~" (kbd "s-S-E"))
(define-key function-key-map "\e[27;7;101~" (kbd "C-M-e"))
(define-key function-key-map "\e[27;8;69~" (kbd "C-M-S-E"))
(define-key function-key-map "\e[27;6;68~" (kbd "C-S-D"))
(define-key function-key-map "\e[27;9;100~" (kbd "s-d"))
(define-key function-key-map "\e[27;10;68~" (kbd "s-S-D"))
(define-key function-key-map "\e[27;7;100~" (kbd "C-M-d"))
(define-key function-key-map "\e[27;8;68~" (kbd "C-M-S-D"))
(define-key function-key-map "\e[27;6;71~" (kbd "C-S-G"))
(define-key function-key-map "\e[27;9;103~" (kbd "s-g"))
(define-key function-key-map "\e[27;10;71~" (kbd "s-S-G"))
(define-key function-key-map "\e[27;7;103~" (kbd "C-M-g"))
(define-key function-key-map "\e[27;8;71~" (kbd "C-M-S-G"))
(define-key function-key-map "\e[27;6;70~" (kbd "C-S-F"))
(define-key function-key-map "\e[27;9;102~" (kbd "s-f"))
(define-key function-key-map "\e[27;10;70~" (kbd "s-S-F"))
(define-key function-key-map "\e[27;7;102~" (kbd "C-M-f"))
(define-key function-key-map "\e[27;8;70~" (kbd "C-M-S-F"))
(define-key function-key-map "\e[27;6;73~" (kbd "C-S-I"))
(define-key function-key-map "\e[27;9;105~" (kbd "s-i"))
(define-key function-key-map "\e[27;10;73~" (kbd "s-S-I"))
(define-key function-key-map "\e[27;7;105~" (kbd "C-M-i"))
(define-key function-key-map "\e[27;8;73~" (kbd "C-M-S-I"))
(define-key function-key-map "\e[27;6;72~" (kbd "C-S-H"))
(define-key function-key-map "\e[27;9;104~" (kbd "s-h"))
(define-key function-key-map "\e[27;10;72~" (kbd "s-S-H"))
(define-key function-key-map "\e[27;7;104~" (kbd "C-M-h"))
(define-key function-key-map "\e[27;8;72~" (kbd "C-M-S-H"))
(define-key function-key-map "\e[27;6;75~" (kbd "C-S-K"))
(define-key function-key-map "\e[27;9;107~" (kbd "s-k"))
(define-key function-key-map "\e[27;10;75~" (kbd "s-S-K"))
(define-key function-key-map "\e[27;7;107~" (kbd "C-M-k"))
(define-key function-key-map "\e[27;8;75~" (kbd "C-M-S-K"))
(define-key function-key-map "\e[27;6;74~" (kbd "C-S-J"))
(define-key function-key-map "\e[27;9;106~" (kbd "s-j"))
(define-key function-key-map "\e[27;10;74~" (kbd "s-S-J"))
(define-key function-key-map "\e[27;7;106~" (kbd "C-M-j"))
(define-key function-key-map "\e[27;8;74~" (kbd "C-M-S-J"))
(define-key function-key-map "\e[27;6;77~" (kbd "C-S-M"))
(define-key function-key-map "\e[27;9;109~" (kbd "s-m"))
(define-key function-key-map "\e[27;10;77~" (kbd "s-S-M"))
(define-key function-key-map "\e[27;7;109~" (kbd "C-M-m"))
(define-key function-key-map "\e[27;8;77~" (kbd "C-M-S-M"))
(define-key function-key-map "\e[27;6;76~" (kbd "C-S-L"))
(define-key function-key-map "\e[27;9;108~" (kbd "s-l"))
(define-key function-key-map "\e[27;10;76~" (kbd "s-S-L"))
(define-key function-key-map "\e[27;7;108~" (kbd "C-M-l"))
(define-key function-key-map "\e[27;8;76~" (kbd "C-M-S-L"))
(define-key function-key-map "\e[27;6;79~" (kbd "C-S-O"))
(define-key function-key-map "\e[27;9;111~" (kbd "s-o"))
(define-key function-key-map "\e[27;10;79~" (kbd "s-S-O"))
(define-key function-key-map "\e[27;7;111~" (kbd "C-M-o"))
(define-key function-key-map "\e[27;8;79~" (kbd "C-M-S-O"))
(define-key function-key-map "\e[27;6;78~" (kbd "C-S-N"))
(define-key function-key-map "\e[27;9;110~" (kbd "s-n"))
(define-key function-key-map "\e[27;10;78~" (kbd "s-S-N"))
(define-key function-key-map "\e[27;7;110~" (kbd "C-M-n"))
(define-key function-key-map "\e[27;8;78~" (kbd "C-M-S-N"))
(define-key function-key-map "\e[27;6;81~" (kbd "C-S-Q"))
(define-key function-key-map "\e[27;9;113~" (kbd "s-q"))
(define-key function-key-map "\e[27;10;81~" (kbd "s-S-Q"))
(define-key function-key-map "\e[27;7;113~" (kbd "C-M-q"))
(define-key function-key-map "\e[27;8;81~" (kbd "C-M-S-Q"))
(define-key function-key-map "\e[27;6;80~" (kbd "C-S-P"))
(define-key function-key-map "\e[27;9;112~" (kbd "s-p"))
(define-key function-key-map "\e[27;10;80~" (kbd "s-S-P"))
(define-key function-key-map "\e[27;7;112~" (kbd "C-M-p"))
(define-key function-key-map "\e[27;8;80~" (kbd "C-M-S-P"))
(define-key function-key-map "\e[27;6;83~" (kbd "C-S-S"))
(define-key function-key-map "\e[27;9;115~" (kbd "s-s"))
(define-key function-key-map "\e[27;10;83~" (kbd "s-S-S"))
(define-key function-key-map "\e[27;7;115~" (kbd "C-M-s"))
(define-key function-key-map "\e[27;8;83~" (kbd "C-M-S-S"))
(define-key function-key-map "\e[27;6;82~" (kbd "C-S-R"))
(define-key function-key-map "\e[27;9;114~" (kbd "s-r"))
(define-key function-key-map "\e[27;10;82~" (kbd "s-S-R"))
(define-key function-key-map "\e[27;7;114~" (kbd "C-M-r"))
(define-key function-key-map "\e[27;8;82~" (kbd "C-M-S-R"))
(define-key function-key-map "\e[27;6;85~" (kbd "C-S-U"))
(define-key function-key-map "\e[27;9;117~" (kbd "s-u"))
(define-key function-key-map "\e[27;10;85~" (kbd "s-S-U"))
(define-key function-key-map "\e[27;7;117~" (kbd "C-M-u"))
(define-key function-key-map "\e[27;8;85~" (kbd "C-M-S-U"))
(define-key function-key-map "\e[27;6;84~" (kbd "C-S-T"))
(define-key function-key-map "\e[27;9;116~" (kbd "s-t"))
(define-key function-key-map "\e[27;10;84~" (kbd "s-S-T"))
(define-key function-key-map "\e[27;7;116~" (kbd "C-M-t"))
(define-key function-key-map "\e[27;8;84~" (kbd "C-M-S-T"))
(define-key function-key-map "\e[27;6;87~" (kbd "C-S-W"))
(define-key function-key-map "\e[27;9;119~" (kbd "s-w"))
(define-key function-key-map "\e[27;10;87~" (kbd "s-S-W"))
(define-key function-key-map "\e[27;7;119~" (kbd "C-M-w"))
(define-key function-key-map "\e[27;8;87~" (kbd "C-M-S-W"))
(define-key function-key-map "\e[27;6;86~" (kbd "C-S-V"))
(define-key function-key-map "\e[27;9;118~" (kbd "s-v"))
(define-key function-key-map "\e[27;10;86~" (kbd "s-S-V"))
(define-key function-key-map "\e[27;7;118~" (kbd "C-M-v"))
(define-key function-key-map "\e[27;8;86~" (kbd "C-M-S-V"))
(define-key function-key-map "\e[27;6;89~" (kbd "C-S-Y"))
(define-key function-key-map "\e[27;9;121~" (kbd "s-y"))
(define-key function-key-map "\e[27;10;89~" (kbd "s-S-Y"))
(define-key function-key-map "\e[27;7;121~" (kbd "C-M-y"))
(define-key function-key-map "\e[27;8;89~" (kbd "C-M-S-Y"))
(define-key function-key-map "\e[27;6;88~" (kbd "C-S-X"))
(define-key function-key-map "\e[27;9;120~" (kbd "s-x"))
(define-key function-key-map "\e[27;10;88~" (kbd "s-S-X"))
(define-key function-key-map "\e[27;7;120~" (kbd "C-M-x"))
(define-key function-key-map "\e[27;8;88~" (kbd "C-M-S-X"))
(define-key function-key-map "\e[27;6;90~" (kbd "C-S-Z"))
(define-key function-key-map "\e[27;9;122~" (kbd "s-z"))
(define-key function-key-map "\e[27;10;90~" (kbd "s-S-Z"))
(define-key function-key-map "\e[27;7;122~" (kbd "C-M-z"))
(define-key function-key-map "\e[27;8;90~" (kbd "C-M-S-Z"))
(define-key function-key-map "\eO5P" [C-f1])
(define-key function-key-map "\eO9P" [s-f1])
(define-key function-key-map "\eO2P" [S-f1])
(define-key function-key-map "\eO3P" [M-f1])
(define-key function-key-map "\eO6P" [C-S-f1])
(define-key function-key-map "\eO4P" [M-S-f1])
(define-key function-key-map "\eO7P" [C-M-f1])
(define-key function-key-map "\eO8P" [C-M-S-f1])
(define-key function-key-map "\eO5Q" [C-f2])
(define-key function-key-map "\eO9Q" [s-f2])
(define-key function-key-map "\eO2Q" [S-f2])
(define-key function-key-map "\eO3Q" [M-f2])
(define-key function-key-map "\eO6Q" [C-S-f2])
(define-key function-key-map "\eO4Q" [M-S-f2])
(define-key function-key-map "\eO7Q" [C-M-f2])
(define-key function-key-map "\eO8Q" [C-M-S-f2])
(define-key function-key-map "\e[1;5C" [C-right])
(define-key function-key-map "\e[1;9C" [s-right])
(define-key function-key-map "\e[1;2C" [S-right])
(define-key function-key-map "\e[1;3C" [M-right])
(define-key function-key-map "\e[1;6C" [C-S-right])
(define-key function-key-map "\e[1;4C" [M-S-right])
(define-key function-key-map "\e[1;7C" [C-M-right])
(define-key function-key-map "\e[1;8C" [C-M-S-right])
(define-key function-key-map "\eO5S" [C-f4])
(define-key function-key-map "\eO9S" [s-f4])
(define-key function-key-map "\eO2S" [S-f4])
(define-key function-key-map "\eO3S" [M-f4])
(define-key function-key-map "\eO6S" [C-S-f4])
(define-key function-key-map "\eO4S" [M-S-f4])
(define-key function-key-map "\eO7S" [C-M-f4])
(define-key function-key-map "\eO8S" [C-M-S-f4])
(define-key function-key-map "\e[15;5~" [C-f5])
(define-key function-key-map "\e[15;9~" [s-f5])
(define-key function-key-map "\e[15;2~" [S-f5])
(define-key function-key-map "\e[15;3~" [M-f5])
(define-key function-key-map "\e[15;6~" [C-S-f5])
(define-key function-key-map "\e[15;4~" [M-S-f5])
(define-key function-key-map "\e[15;7~" [C-M-f5])
(define-key function-key-map "\e[15;8~" [C-M-S-f5])
(define-key function-key-map "\e[17;5~" [C-f6])
(define-key function-key-map "\e[17;9~" [s-f6])
(define-key function-key-map "\e[17;2~" [S-f6])
(define-key function-key-map "\e[17;3~" [M-f6])
(define-key function-key-map "\e[17;6~" [C-S-f6])
(define-key function-key-map "\e[17;4~" [M-S-f6])
(define-key function-key-map "\e[17;7~" [C-M-f6])
(define-key function-key-map "\e[17;8~" [C-M-S-f6])
(define-key function-key-map "\e[18;5~" [C-f7])
(define-key function-key-map "\e[18;9~" [s-f7])
(define-key function-key-map "\e[18;2~" [S-f7])
(define-key function-key-map "\e[18;3~" [M-f7])
(define-key function-key-map "\e[18;6~" [C-S-f7])
(define-key function-key-map "\e[18;4~" [M-S-f7])
(define-key function-key-map "\e[18;7~" [C-M-f7])
(define-key function-key-map "\e[18;8~" [C-M-S-f7])
(define-key function-key-map "\e[19;5~" [C-f8])
(define-key function-key-map "\e[19;9~" [s-f8])
(define-key function-key-map "\e[19;2~" [S-f8])
(define-key function-key-map "\e[19;3~" [M-f8])
(define-key function-key-map "\e[19;6~" [C-S-f8])
(define-key function-key-map "\e[19;4~" [M-S-f8])
(define-key function-key-map "\e[19;7~" [C-M-f8])
(define-key function-key-map "\e[19;8~" [C-M-S-f8])
(define-key function-key-map "\e[20;5~" [C-f9])
(define-key function-key-map "\e[20;9~" [s-f9])
(define-key function-key-map "\e[20;2~" [S-f9])
(define-key function-key-map "\e[20;3~" [M-f9])
(define-key function-key-map "\e[20;6~" [C-S-f9])
(define-key function-key-map "\e[20;4~" [M-S-f9])
(define-key function-key-map "\e[20;7~" [C-M-f9])
(define-key function-key-map "\e[20;8~" [C-M-S-f9])
(define-key function-key-map "\e[1;5B" [C-down])
(define-key function-key-map "\e[1;9B" [s-down])
(define-key function-key-map "\e[1;2B" [S-down])
(define-key function-key-map "\e[1;3B" [M-down])
(define-key function-key-map "\e[1;6B" [C-S-down])
(define-key function-key-map "\e[1;4B" [M-S-down])
(define-key function-key-map "\e[1;7B" [C-M-down])
(define-key function-key-map "\e[1;8B" [C-M-S-down])
(define-key function-key-map "\eO5R" [C-f3])
(define-key function-key-map "\eO9R" [s-f3])
(define-key function-key-map "\eO2R" [S-f3])
(define-key function-key-map "\eO3R" [M-f3])
(define-key function-key-map "\eO6R" [C-S-f3])
(define-key function-key-map "\eO4R" [M-S-f3])
(define-key function-key-map "\eO7R" [C-M-f3])
(define-key function-key-map "\eO8R" [C-M-S-f3])
(define-key function-key-map "\e[27;5;9~" [C-tab])
(define-key function-key-map "\e[27;9;9~" [s-tab])
(define-key function-key-map "\e[27;2;9~" [S-tab])
(define-key function-key-map "\e[27;3;9~" [M-tab])
(define-key function-key-map "\e[27;6;9~" [C-S-tab])
(define-key function-key-map "\e[27;4;9~" [M-S-tab])
(define-key function-key-map "\e[27;7;9~" [C-M-tab])
(define-key function-key-map "\e[27;8;9~" [C-M-S-tab])
(define-key function-key-map "\e[1;5H" [C-home])
(define-key function-key-map "\e[1;9H" [s-home])
(define-key function-key-map "\e[1;2H" [S-home])
(define-key function-key-map "\e[1;3H" [M-home])
(define-key function-key-map "\e[1;6H" [C-S-home])
(define-key function-key-map "\e[1;4H" [M-S-home])
(define-key function-key-map "\e[1;7H" [C-M-home])
(define-key function-key-map "\e[1;8H" [C-M-S-home])
(define-key function-key-map "\e[1;5F" [C-end])
(define-key function-key-map "\e[1;9F" [s-end])
(define-key function-key-map "\e[1;2F" [S-end])
(define-key function-key-map "\e[1;3F" [M-end])
(define-key function-key-map "\e[1;6F" [C-S-end])
(define-key function-key-map "\e[1;4F" [M-S-end])
(define-key function-key-map "\e[1;7F" [C-M-end])
(define-key function-key-map "\e[1;8F" [C-M-S-end])
(define-key function-key-map "\e[6;5~" [C-next])
(define-key function-key-map "\e[6;9~" [s-next])
(define-key function-key-map "\e[6;2~" [S-next])
(define-key function-key-map "\e[6;3~" [M-next])
(define-key function-key-map "\e[6;6~" [C-S-next])
(define-key function-key-map "\e[6;4~" [M-S-next])
(define-key function-key-map "\e[6;7~" [C-M-next])
(define-key function-key-map "\e[6;8~" [C-M-S-next])
(define-key function-key-map "\e[27;5;13~" [C-return])
(define-key function-key-map "\e[27;9;13~" [s-return])
(define-key function-key-map "\e[27;2;13~" [S-return])
(define-key function-key-map "\e[27;3;13~" [M-return])
(define-key function-key-map "\e[27;6;13~" [C-S-return])
(define-key function-key-map "\e[27;4;13~" [M-S-return])
(define-key function-key-map "\e[27;7;13~" [C-M-return])
(define-key function-key-map "\e[27;8;13~" [C-M-S-return])
(define-key function-key-map "\e[2;5~" [C-insert])
(define-key function-key-map "\e[2;9~" [s-insert])
(define-key function-key-map "\e[2;2~" [S-insert])
(define-key function-key-map "\e[2;3~" [M-insert])
(define-key function-key-map "\e[2;6~" [C-S-insert])
(define-key function-key-map "\e[2;4~" [M-S-insert])
(define-key function-key-map "\e[2;7~" [C-M-insert])
(define-key function-key-map "\e[2;8~" [C-M-S-insert])
(define-key function-key-map "\e[23;5~" [C-f11])
(define-key function-key-map "\e[23;9~" [s-f11])
(define-key function-key-map "\e[23;2~" [S-f11])
(define-key function-key-map "\e[23;3~" [M-f11])
(define-key function-key-map "\e[23;6~" [C-S-f11])
(define-key function-key-map "\e[23;4~" [M-S-f11])
(define-key function-key-map "\e[23;7~" [C-M-f11])
(define-key function-key-map "\e[23;8~" [C-M-S-f11])
(define-key function-key-map "\e[1;5A" [C-up])
(define-key function-key-map "\e[1;9A" [s-up])
(define-key function-key-map "\e[1;2A" [S-up])
(define-key function-key-map "\e[1;3A" [M-up])
(define-key function-key-map "\e[1;6A" [C-S-up])
(define-key function-key-map "\e[1;4A" [M-S-up])
(define-key function-key-map "\e[1;7A" [C-M-up])
(define-key function-key-map "\e[1;8A" [C-M-S-up])
(define-key function-key-map "\e[5;5~" [C-prior])
(define-key function-key-map "\e[5;9~" [s-prior])
(define-key function-key-map "\e[5;2~" [S-prior])
(define-key function-key-map "\e[5;3~" [M-prior])
(define-key function-key-map "\e[5;6~" [C-S-prior])
(define-key function-key-map "\e[5;4~" [M-S-prior])
(define-key function-key-map "\e[5;7~" [C-M-prior])
(define-key function-key-map "\e[5;8~" [C-M-S-prior])
(define-key function-key-map "\e[24;5~" [C-f12])
(define-key function-key-map "\e[24;9~" [s-f12])
(define-key function-key-map "\e[24;2~" [S-f12])
(define-key function-key-map "\e[24;3~" [M-f12])
(define-key function-key-map "\e[24;6~" [C-S-f12])
(define-key function-key-map "\e[24;4~" [M-S-f12])
(define-key function-key-map "\e[24;7~" [C-M-f12])
(define-key function-key-map "\e[24;8~" [C-M-S-f12])
(define-key function-key-map "\e[21;5~" [C-f10])
(define-key function-key-map "\e[21;9~" [s-f10])
(define-key function-key-map "\e[21;2~" [S-f10])
(define-key function-key-map "\e[21;3~" [M-f10])
(define-key function-key-map "\e[21;6~" [C-S-f10])
(define-key function-key-map "\e[21;4~" [M-S-f10])
(define-key function-key-map "\e[21;7~" [C-M-f10])
(define-key function-key-map "\e[21;8~" [C-M-S-f10])
(define-key function-key-map "\e[1;5D" [C-left])
(define-key function-key-map "\e[1;9D" [s-left])
(define-key function-key-map "\e[1;2D" [S-left])
(define-key function-key-map "\e[1;3D" [M-left])
(define-key function-key-map "\e[1;6D" [C-S-left])
(define-key function-key-map "\e[1;4D" [M-S-left])
(define-key function-key-map "\e[1;7D" [C-M-left])
(define-key function-key-map "\e[1;8D" [C-M-S-left])
(define-key function-key-map "\e[3;5~" [C-delete])
(define-key function-key-map "\e[3;9~" [s-delete])
(define-key function-key-map "\e[3;2~" [S-delete])
(define-key function-key-map "\e[3;3~" [M-delete])
(define-key function-key-map "\e[3;6~" [C-S-delete])
(define-key function-key-map "\e[3;4~" [M-S-delete])
(define-key function-key-map "\e[3;7~" [C-M-delete])
(define-key function-key-map "\e[3;8~" [C-M-S-delete])
;; --------<<  iterm-keysetting ends here



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

(evil-define-minor-mode-key 'insert 'lsp-mode
  (kbd "TAB") 'completion-at-point
)

(evil-define-key nil evil-motion-state-map
  (kbd "C-a") 'evil-beginning-of-line
  (kbd "C-e") 'evil-end-of-line
)

(evil-define-key nil evil-insert-state-map
  (kbd "C-a") 'beginning-of-line
  (kbd "C-e") 'end-of-line
  (kbd "C-n") 'next-line
  (kbd "C-p") 'previous-line
)
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



;; -------->>  [[file:init.org::org][org]]

;; --------<<  org ends here



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



;; -------->>  [[file:init.org::org-ml][org-ml]]
(straight-use-package 'org-ml)

(require 'org-ml)
;; --------<<  org-ml ends here



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



;; -------->>  [[file:init.org::magit-forge][magit-forge]]
(straight-use-package 'forge)
;; --------<<  magit-forge ends here



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



;; -------->>  [[file:init.org::markdown][markdown]]
(use-package markdown-mode
 :straight t
 :mode "//.md//'")
;; --------<<  markdown ends here



;; -------->>  [[file:init.org::edebug][edebug]]
(general-define-key
  :keymaps 'edebug-mode-map
  :states 'emacs
  "C-f"      '(edebug-step-throught-mode     :which-key "edebug next step.")
)
;; edebug
(use-package eros
 :straight t)
(require 'eros)

;(defun adviced:edebug-compute-previous-result (_ &rest r)
;  "Adviced `edebug-compute-previous-result'."
;  (let ((previous-value (nth 0 r)))
;    (if edebug-unwrap-results
;        (setq previous-value
;              (edebug-unwrap* previous-value)))
;    (setq edebug-previous-result
;          (edebug-safe-prin1-to-string previous-value))))
;
;(advice-add #'edebug-compute-previous-result
;            :around
;            #'adviced:edebug-compute-previous-result)


(defun adviced:edebug-previous-result (_ &rest r)
  "Adviced `edebug-previous-result'."
  (eros--make-result-overlay edebug-previous-result
    :where (point)
    :duration eros-eval-result-duration))

(advice-add #'edebug-previous-result
            :around
            #'adviced:edebug-previous-result)
;; --------<<  edebug ends here



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



;; -------->>  [[file:init.org::lsp-bridge][lsp-bridge]]
(use-package lsp-bridge
:straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
          :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
          :build (:not compile))
:init
(global-lsp-bridge-mode))
(setq acm-enable-copilot t)

(setq lsp-bridge-python-command "/usr/bin/python3")

(general-define-key  :prefix "s-l"
     "b"      '(:ignore t  :which-key "lsp-bridge prefix")
     "b d"    '(lsp-bridge-find-def :which-key "find define")
     "b p"    '(lsp-bridge-peek :which-key "bridge peek")
     "b r"    '(lsp-bridge-rename :which-key "bridge peek")
     "b f"    '(lsp-bridge-code-format :which-key "format code"))
;; --------<<  lsp-bridge ends here



;; -------->>  [[file:init.org::copilot][copilot]]
(use-package copilot
 :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
 :ensure t)
 (add-hook 'go-mode-hook 'copilot-mode)

(general-define-key  :prefix "s-l"
         "c"      '(:ignore t  :which-key "copilot prefix")
         "c c"    '(copilot-complete :which-key "complete")
         "c C"    '(copilot-panel-complete :which-key "panel complete")
         "c p"    '(copilot-previous-completion :which-key "select previous")
         "c n"    '(copilot-next-completion :which-key "select next")
         "c r"    '(copilot-accept-completion-by-line :which-key "accept by line")
         "c w"    '(copilot-accept-completion-by-word :which-key "accept by word")
         "c P"    '(copilot-accept-completion-by-paragraph :which-key "accept by paragraph")
         "c a"    '(copilot-accept-completion :which-key "accept complete"))
;; --------<<  copilot ends here



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
(load-file "~/.emacs.d/mode/tangle-sync.el")
;; --------<<  curx ends here



;; -------->>  [[file:init.org::function][function]]
(defun cao-emacs-counsel-ag ()
    (interactive)
    (counsel-ag nil default-directory))

  (general-define-key
      :prefix "s-e"
      "s-f"      '(cao-emacs-counsel-ag :which-key "grep in current directory.")
  )


(defun learnify-open-emacsd-dir ()
  (interactive)
  (dired "~/.emacs.d"))


(general-define-key
 "s-e h h" #'learnify-open-emacsd-dir)
;; --------<<  function ends here


