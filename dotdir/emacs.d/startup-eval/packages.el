(add-to-list 'load-path (concat emacs-extension-dir "/site-lisp/use-package"))
(require 'use-package)

(use-package magit
  :ensure t)

(use-package lsp-mode
  :hook (go-mode . lsp)
  :commands lsp)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
