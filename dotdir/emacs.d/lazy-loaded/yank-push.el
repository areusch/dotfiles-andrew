;;;###autoload
(defun yank-push ()
  "Replace the just-yanked text with the text yanked just before it."
  (interactive)
  (yank-pop -1))

(global-set-key "\C-\M-y" 'yank-push)
