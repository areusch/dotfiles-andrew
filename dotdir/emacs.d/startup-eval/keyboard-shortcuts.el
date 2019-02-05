(global-set-key "\C-c=" 'count-words-region)
(global-set-key "\C-c0" 'compile)

(eval-after-load 'latex
  '(define-key LaTeX-mode-map (kbd "C-c C-c") 'areusch-latex-go))

(eval-after-load 'latex
  '(define-key LaTeX-mode-map (kbd "C-c C-v") 'areusch-latex-view))

(global-set-key (kbd "C-M-]") 'magit-status)

(provide 'areusch-keyboard-shortcuts)

(require 'cc-mode)
(define-key c-mode-base-map (kbd "C-c C-/") 'c-switch-decl-impl)
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-M-K") 'kite)
