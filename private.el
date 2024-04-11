(defun learnify-open-emacsd-dir ()
  (interactive)
  (dired "~/.emacs.d"))


(general-define-key
  "s-e h h" #'learnify-open-emacsd-dir)
 
