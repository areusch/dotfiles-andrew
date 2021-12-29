;;; autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "../lazy-loaded/c-gen" "../lazy-loaded/c-gen.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/c-gen.el

(autoload 'c-gen "../lazy-loaded/c-gen" "\
Auto-generate C headers

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/c-gen" '("c-")))

;;;***

;;;### (autoloads nil "../lazy-loaded/c-switch-decl-impl" "../lazy-loaded/c-switch-decl-impl.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/c-switch-decl-impl.el

(autoload 'c-switch-decl-impl "../lazy-loaded/c-switch-decl-impl" "\
In C mode, switch to the buffer's header or implemenation.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/c-switch-decl-impl" '("c-try-switch-to" "areusch-c-impl-exts")))

;;;***

;;;### (autoloads nil "../lazy-loaded/count-words-region" "../lazy-loaded/count-words-region.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/count-words-region.el

(autoload 'count-words-region "../lazy-loaded/count-words-region" "\
Print number of words in the region.

\(fn BEGINNING END)" t nil)

;;;***

;;;### (autoloads nil "../lazy-loaded/dash" "../lazy-loaded/dash.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/dash.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/dash" '("dash-" "-keep" "-butlast" "-non" "-only-some" "-zip" "-e" "->" "-a" "-gr" "-when-let" "-d" "-l" "-s" "-p" "-r" "-m" "-i" "-f" "-u" "-value-to-list" "-t" "--" "-c" "!cons" "!cdr")))

;;;***

;;;### (autoloads nil "../lazy-loaded/go-mode" "../lazy-loaded/go-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/go-mode.el

(autoload 'go-mode "../lazy-loaded/go-mode" "\
Major mode for editing Go source text.

This provides basic syntax highlighting for keywords, built-ins,
functions, and some types.  It also provides indentation that is
\(almost) identical to gofmt.

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons "\\.go$" #'go-mode))

(autoload 'gofmt "../lazy-loaded/go-mode" "\
Pipe the current buffer through the external tool `gofmt`.
Replace the current buffer on success; display errors on failure.

\(fn)" t nil)

(autoload 'gofmt-before-save "../lazy-loaded/go-mode" "\
Add this to .emacs to run gofmt on the current buffer when saving:
 (add-hook 'before-save-hook #'gofmt-before-save)

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/go-mode" '("go-mode-")))

;;;***

;;;### (autoloads nil "../lazy-loaded/js2" "../lazy-loaded/js2.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/js2.el
 (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'js2-mode "../lazy-loaded/js2" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/js2" '("js-" "js2" "char-is-" "with-buffer" "neq" "deflocal")))

;;;***

;;;### (autoloads nil "../lazy-loaded/json" "../lazy-loaded/json.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/json.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/json" '("json-")))

;;;***

;;;### (autoloads nil "../lazy-loaded/kill-buffers-in-dir" "../lazy-loaded/kill-buffers-in-dir.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/kill-buffers-in-dir.el

(autoload 'kill-buffers-in-dir "../lazy-loaded/kill-buffers-in-dir" "\
Kill buffers in specified dir. If dir unspecified, ask the user.

\(fn &optional DIR)" t nil)

;;;***

;;;### (autoloads nil "../lazy-loaded/kite" "../lazy-loaded/kite.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/kite.el

(autoload 'kite "../lazy-loaded/kite" "\


\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/kite" '("kite-" "alist-get-keys")))

;;;***

;;;### (autoloads nil "../lazy-loaded/projects" "../lazy-loaded/projects.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/projects.el

(autoload 'project-root-path "../lazy-loaded/projects" "\
Locate the project root, as identified by files in project-root-files.

\(fn &optional FILE-NAME)" nil nil)

(autoload 'get-project-definition "../lazy-loaded/projects" "\
Locate a project definition file, if any, and read it; if none exists, prompts 

\(fn F &optional FORCE-RELOAD)" nil nil)

(autoload 'print-project-definition "../lazy-loaded/projects" "\


\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/projects" '("write-project-definition" "gen-project-definition" "get-project-definition-file" "project-" "display-project-root-path")))

;;;***

;;;### (autoloads nil "../lazy-loaded/set-executable" "../lazy-loaded/set-executable.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/set-executable.el

(autoload 'set-executable "../lazy-loaded/set-executable" "\
Set the given file (or otherwise the current buffer's backing file)
   executable.

\(fn &optional EXPLICIT-FILE-NAME)" t nil)

;;;***

;;;### (autoloads nil "../lazy-loaded/third-party/rename-file-and-buffer"
;;;;;;  "../lazy-loaded/third-party/rename-file-and-buffer.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ../lazy-loaded/third-party/rename-file-and-buffer.el

(autoload 'rename-file-and-buffer "../lazy-loaded/third-party/rename-file-and-buffer" "\
Renames both current buffer and file it's visiting to NEW-NAME.

\(fn NEW-NAME)" t nil)

;;;***

;;;### (autoloads nil "../lazy-loaded/tramp-projects" "../lazy-loaded/tramp-projects.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/tramp-projects.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/tramp-projects" '("tramp-project-")))

;;;***

;;;### (autoloads nil "../lazy-loaded/traverse-accessible-dirs" "../lazy-loaded/traverse-accessible-dirs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/traverse-accessible-dirs.el

(autoload 'string-matches-regex-list "../lazy-loaded/traverse-accessible-dirs" "\
Returns t if str matches one of the regexes in list.

\(fn STR LST)" nil nil)

(autoload 'traverse-accessible-dirs "../lazy-loaded/traverse-accessible-dirs" "\
Traverse accessible, non-blacklisted directories under root. If nil,

\(fn ROOT CALLBACK &optional BLACKLIST PREORDER MAX-DEPTH)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/traverse-accessible-dirs" '("traverse-")))

;;;***

;;;### (autoloads nil "../lazy-loaded/util" "../lazy-loaded/util.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/util.el

(autoload 'list-contains-string "../lazy-loaded/util" "\
Returns t if str is in lst.

\(fn LST STR)" nil nil)

(autoload 'string-begins-with "../lazy-loaded/util" "\
Returns nil if str does not begin with prefix

\(fn STR PREFIX)" nil nil)

(autoload 'string-find-and-replace "../lazy-loaded/util" "\
Replace occurences of regexp with replace-with in string

\(fn STRING REGEXP REPLACE-WITH)" nil nil)

(autoload 'areusch-assoc-delete "../lazy-loaded/util" "\
Delete all elements from alist whose car is `equal` to key. Returns the
   modified alist.

\(fn ALIST KEY)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/util" '("string-find-and-replace-recurse")))

;;;***

;;;### (autoloads nil "../lazy-loaded/yank-push" "../lazy-loaded/yank-push.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../lazy-loaded/yank-push.el

(autoload 'yank-push "../lazy-loaded/yank-push" "\
Replace the just-yanked text with the text yanked just before it.

\(fn)" t nil)

;;;***

(provide 'autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; autoloads.el ends here
