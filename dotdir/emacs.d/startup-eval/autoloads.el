;;; autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "../lazy-loaded/c-gen" "../../../../.emacs.d/lazy-loaded/c-gen.el"
;;;;;;  "7cbea0432495835d3f649daa48fde32f")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/c-gen.el

(autoload 'c-gen "../lazy-loaded/c-gen" "\
Auto-generate C headers

\(fn)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/c-gen"
;;;;;;  "../../../../.emacs.d/lazy-loaded/c-gen.el" (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/c-gen.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/c-gen" '("c-")))

;;;***

;;;***

;;;### (autoloads nil "../lazy-loaded/c-switch-decl-impl" "../../../../.emacs.d/lazy-loaded/c-switch-decl-impl.el"
;;;;;;  "b5ff59ce9afcd13b4e45b23d1e9fd44c")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/c-switch-decl-impl.el

(autoload 'c-switch-decl-impl "../lazy-loaded/c-switch-decl-impl" "\
In C mode, switch to the buffer's header or implemenation.

\(fn)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/c-switch-decl-impl"
;;;;;;  "../../../../.emacs.d/lazy-loaded/c-switch-decl-impl.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/c-switch-decl-impl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/c-switch-decl-impl" '("c-try-switch-to" "areusch-c-impl-exts")))

;;;***

;;;***

;;;### (autoloads nil "../lazy-loaded/count-words-region" "../../../../.emacs.d/lazy-loaded/count-words-region.el"
;;;;;;  "718597e21acbf2f1b7d446dbc5c87828")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/count-words-region.el

(autoload 'count-words-region "../lazy-loaded/count-words-region" "\
Print number of words in the region.

\(fn BEGINNING END)" t nil)

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/dash"
;;;;;;  "../../../../.emacs.d/lazy-loaded/dash.el" (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/dash.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/dash" '("dash-" "-keep" "-butlast" "-non" "-only-some" "-zip" "-e" "->" "-a" "-gr" "-when-let" "-d" "-l" "-s" "-p" "-r" "-m" "-i" "-f" "-u" "-value-to-list" "-t" "--" "-c" "!cons" "!cdr")))

;;;***

;;;### (autoloads nil "../lazy-loaded/go-mode" "../../../../.emacs.d/lazy-loaded/go-mode.el"
;;;;;;  "e7358be6b7e6d91bdceb49b636679637")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/go-mode.el

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

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/go-mode"
;;;;;;  "../../../../.emacs.d/lazy-loaded/go-mode.el" (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/go-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/go-mode" '("go-mode-")))

;;;***

;;;***

;;;### (autoloads nil "../lazy-loaded/js2" "../../../../.emacs.d/lazy-loaded/js2.el"
;;;;;;  "e20cbcc2740e8da234a50c8e9593de51")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/js2.el
 (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'js2-mode "../lazy-loaded/js2" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/js2"
;;;;;;  "../../../../.emacs.d/lazy-loaded/js2.el" (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/js2.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/js2" '("js-" "js2" "char-is-" "with-buffer" "neq" "deflocal")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/json"
;;;;;;  "../../../../.emacs.d/lazy-loaded/json.el" (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/json.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/json" '("json-")))

;;;***

;;;### (autoloads nil "../lazy-loaded/kill-buffers-in-dir" "../../../../.emacs.d/lazy-loaded/kill-buffers-in-dir.el"
;;;;;;  "97896bb41b0775124197a9516401a27f")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/kill-buffers-in-dir.el

(autoload 'kill-buffers-in-dir "../lazy-loaded/kill-buffers-in-dir" "\
Kill buffers in specified dir. If dir unspecified, ask the user.

\(fn &optional DIR)" t nil)

;;;***

;;;### (autoloads nil "../lazy-loaded/kite" "../../../../.emacs.d/lazy-loaded/kite.el"
;;;;;;  "8b2f42d2b88df4a0fc258c1f2631aa86")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/kite.el

(autoload 'kite "../lazy-loaded/kite" "\


\(fn)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/kite"
;;;;;;  "../../../../.emacs.d/lazy-loaded/kite.el" (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/kite.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/kite" '("kite-" "alist-get-keys")))

;;;***

;;;***

;;;### (autoloads nil "../lazy-loaded/projects" "../../../../.emacs.d/lazy-loaded/projects.el"
;;;;;;  "e05c679cd8362620889b84368de63471")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/projects.el

(autoload 'project-root-path "../lazy-loaded/projects" "\
Locate the project root, as identified by files in project-root-files.

\(fn &optional FILE-NAME)" nil nil)

(autoload 'get-project-definition "../lazy-loaded/projects" "\
Locate a project definition file, if any, and read it; if none exists, prompts 

\(fn F &optional FORCE-RELOAD)" nil nil)

(autoload 'print-project-definition "../lazy-loaded/projects" "\


\(fn)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/projects"
;;;;;;  "../../../../.emacs.d/lazy-loaded/projects.el" (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/projects.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/projects" '("write-project-definition" "gen-project-definition" "get-project-definition-file" "project-" "display-project-root-path")))

;;;***

;;;***

;;;### (autoloads nil "../lazy-loaded/set-executable" "../../../../.emacs.d/lazy-loaded/set-executable.el"
;;;;;;  "5492c33472788e67149a1013a834184e")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/set-executable.el

(autoload 'set-executable "../lazy-loaded/set-executable" "\
Set the given file (or otherwise the current buffer's backing file)
   executable.

\(fn &optional EXPLICIT-FILE-NAME)" t nil)

;;;***

;;;### (autoloads nil "../lazy-loaded/third-party/rename-file-and-buffer"
;;;;;;  "../../../../.emacs.d/lazy-loaded/third-party/rename-file-and-buffer.el"
;;;;;;  "7e42ae9a883de602cfdc4386a580b576")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/third-party/rename-file-and-buffer.el

(autoload 'rename-file-and-buffer "../lazy-loaded/third-party/rename-file-and-buffer" "\
Renames both current buffer and file it's visiting to NEW-NAME.

\(fn NEW-NAME)" t nil)

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/tramp-projects"
;;;;;;  "../../../../.emacs.d/lazy-loaded/tramp-projects.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/tramp-projects.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/tramp-projects" '("tramp-project-")))

;;;***

;;;### (autoloads nil "../lazy-loaded/traverse-accessible-dirs" "../../../../.emacs.d/lazy-loaded/traverse-accessible-dirs.el"
;;;;;;  "647b99745c40323901fd885a311b5e7f")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/traverse-accessible-dirs.el

(autoload 'string-matches-regex-list "../lazy-loaded/traverse-accessible-dirs" "\
Returns t if str matches one of the regexes in list.

\(fn STR LST)" nil nil)

(autoload 'traverse-accessible-dirs "../lazy-loaded/traverse-accessible-dirs" "\
Traverse accessible, non-blacklisted directories under root. If nil,

\(fn ROOT CALLBACK &optional BLACKLIST PREORDER MAX-DEPTH)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/traverse-accessible-dirs"
;;;;;;  "../../../../.emacs.d/lazy-loaded/traverse-accessible-dirs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/traverse-accessible-dirs.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/traverse-accessible-dirs" '("traverse-")))

;;;***

;;;***

;;;### (autoloads nil "../lazy-loaded/util" "../../../../.emacs.d/lazy-loaded/util.el"
;;;;;;  "083c30051607e4d1c2fd8fd5e0070ddc")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/util.el

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

;;;### (autoloads "actual autoloads are elsewhere" "../lazy-loaded/util"
;;;;;;  "../../../../.emacs.d/lazy-loaded/util.el" (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../lazy-loaded/util" '("string-find-and-replace-recurse")))

;;;***

;;;***

;;;### (autoloads nil "../lazy-loaded/yank-push" "../../../../.emacs.d/lazy-loaded/yank-push.el"
;;;;;;  "f96790804e551bfe7f03b676e6ece3f6")
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/yank-push.el

(autoload 'yank-push "../lazy-loaded/yank-push" "\
Replace the just-yanked text with the text yanked just before it.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/lazy-loaded/c-gen.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/c-switch-decl-impl.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/count-words-region.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/dash.el" "../../../../.emacs.d/lazy-loaded/go-mode.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/js2.el" "../../../../.emacs.d/lazy-loaded/json.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/kill-buffers-in-dir.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/kite.el" "../../../../.emacs.d/lazy-loaded/projects.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/set-executable.el" "../../../../.emacs.d/lazy-loaded/third-party/rename-file-and-buffer.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/tramp-projects.el" "../../../../.emacs.d/lazy-loaded/traverse-accessible-dirs.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/util.el" "../../../../.emacs.d/lazy-loaded/yank-push.el")
;;;;;;  (0 0 0 0))

;;;***

(provide 'autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; autoloads.el ends here
