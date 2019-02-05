(add-to-list 'load-path (concat emacs-extension-dir "/site-lisp/use-package"))
(require 'use-package)

(use-package magit
  :ensure t)
