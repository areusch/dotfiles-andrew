(global-set-key "\C-c=" 'count-words-region)
(global-set-key "\C-c0" 'compile)

(eval-after-load 'latex
  '(define-key LaTeX-mode-map (kbd "C-c C-c") 'areusch-latex-go))

(eval-after-load 'latex
  '(define-key LaTeX-mode-map (kbd "C-c C-v") 'areusch-latex-view))

(global-set-key (kbd "C-M-]") 'magit-status)

(provide 'areusch-keyboard-shortcuts)
