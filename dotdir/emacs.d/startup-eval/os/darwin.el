(setq mac-command-modifier 'meta)

(defun tool-bar-copy-interactive ()
  ""
  (interactive)
  ((lookup-key menu-bar-edit-menu [cut])))

(global-set-key "\C-\M-v" 'tool-bar-copy-interactive)

(global-set-key "\M-`" 'other-frame)

(provide 'areusch-darwin-support)