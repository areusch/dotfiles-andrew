;;; autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (areusch-print-project-definition areusch-get-project-definition
;;;;;;  areusch-project-root-path) "areusch-projects" "../lazy-loaded/areusch-projects.el"
;;;;;;  (20137 1407))
;;; Generated autoloads from ../lazy-loaded/areusch-projects.el

(autoload 'areusch-project-root-path "areusch-projects" "\
Locate the project root, as identified by files in areusch-project-root-files.

\(fn &optional FILE-NAME)" nil nil)

(autoload 'areusch-get-project-definition "areusch-projects" "\
Locate a project definition file, if any, and read it; if none exists, prompts 

\(fn F &optional FORCE-RELOAD)" nil nil)

(autoload 'areusch-print-project-definition "areusch-projects" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (c-gen) "c-gen" "../lazy-loaded/c-gen.el" (20137
;;;;;;  1427))
;;; Generated autoloads from ../lazy-loaded/c-gen.el

(autoload 'c-gen "c-gen" "\
Auto-generate C headers

\(fn)" t nil)

;;;***

;;;### (autoloads (c-switch-decl-impl) "c-switch-decl-impl" "../lazy-loaded/c-switch-decl-impl.el"
;;;;;;  (20137 1419))
;;; Generated autoloads from ../lazy-loaded/c-switch-decl-impl.el

(autoload 'c-switch-decl-impl "c-switch-decl-impl" "\
In C mode, switch to the buffer's header or implemenation.

\(fn)" t nil)

;;;***

;;;### (autoloads (count-words-region) "count-words-region" "../lazy-loaded/count-words-region.el"
;;;;;;  (20137 1441))
;;; Generated autoloads from ../lazy-loaded/count-words-region.el

(autoload 'count-words-region "count-words-region" "\
Print number of words in the region.

\(fn BEGINNING END)" t nil)

;;;***

;;;### (autoloads (js2-mode) "js2" "../lazy-loaded/js2.el" (20132
;;;;;;  62302))
;;; Generated autoloads from ../lazy-loaded/js2.el
 (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'js2-mode "js2" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

;;;***

;;;### (autoloads (magit-status) "magit" "../lazy-loaded/magit.el"
;;;;;;  (20132 62303))
;;; Generated autoloads from ../lazy-loaded/magit.el

(autoload 'magit-status "magit" "\
Not documented

\(fn DIR)" t nil)

;;;***

;;;### (autoloads (traverse-accessible-dirs) "util" "../lazy-loaded/util.el"
;;;;;;  (20137 655))
;;; Generated autoloads from ../lazy-loaded/util.el

(autoload 'traverse-accessible-dirs "util" "\
Traverse accessible, non-blacklisted directories under root. If nil,

\(fn ROOT CALLBACK &optional BLACKLIST)" nil nil)

;;;***

;;;### (autoloads (yank-push) "yank-push" "../lazy-loaded/yank-push.el"
;;;;;;  (20137 1506))
;;; Generated autoloads from ../lazy-loaded/yank-push.el

(autoload 'yank-push "yank-push" "\
Replace the just-yanked text with the text yanked just before it.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../lazy-loaded/json.el" "../lazy-loaded/kill-buffers-in-dir.el")
;;;;;;  (20137 1653 995763))

;;;***

(provide 'autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; autoloads.el ends here
