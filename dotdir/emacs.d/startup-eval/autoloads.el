;;; autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (c-gen) "c-gen" "../lazy-loaded/c-gen.el" (20137
;;;;;;  5384))
;;; Generated autoloads from ../lazy-loaded/c-gen.el

(autoload 'c-gen "c-gen" "\
Auto-generate C headers

\(fn)" t nil)

;;;***

;;;### (autoloads (c-switch-decl-impl) "c-switch-decl-impl" "../lazy-loaded/c-switch-decl-impl.el"
;;;;;;  (20137 5384))
;;; Generated autoloads from ../lazy-loaded/c-switch-decl-impl.el

(autoload 'c-switch-decl-impl "c-switch-decl-impl" "\
In C mode, switch to the buffer's header or implemenation.

\(fn)" t nil)

;;;***

;;;### (autoloads (count-words-region) "count-words-region" "../lazy-loaded/count-words-region.el"
;;;;;;  (20137 5384))
;;; Generated autoloads from ../lazy-loaded/count-words-region.el

(autoload 'count-words-region "count-words-region" "\
Print number of words in the region.

\(fn BEGINNING END)" t nil)

;;;***

;;;### (autoloads (gofmt-before-save gofmt go-mode) "go-mode" "../../../../.emacs.d/lazy-loaded/go-mode.el"
;;;;;;  (20178 61765))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/go-mode.el

(autoload 'go-mode "go-mode" "\
Major mode for editing Go source text.

This provides basic syntax highlighting for keywords, built-ins,
functions, and some types.  It also provides indentation that is
\(almost) identical to gofmt.

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons "\\.go$" #'go-mode))

(autoload 'gofmt "go-mode" "\
Pipe the current buffer through the external tool `gofmt`.
Replace the current buffer on success; display errors on failure.

\(fn)" t nil)

(autoload 'gofmt-before-save "go-mode" "\
Add this to .emacs to run gofmt on the current buffer when saving:
 (add-hook 'before-save-hook #'gofmt-before-save)

\(fn)" t nil)

;;;***

;;;### (autoloads (google-maps) "google-maps" "../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps.el"
;;;;;;  (20144 61861))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps.el

(autoload 'google-maps "google-maps" "\
Run Google Maps on LOCATION.
If NO-GEOCODING is t, then does not try to geocode the address
and do not ask the user for a more precise location.

\(fn LOCATION &optional NO-GEOCODING)" t nil)

;;;***

;;;### (autoloads (google-maps-geocode-replace-region) "google-maps-geocode"
;;;;;;  "../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps-geocode.el"
;;;;;;  (20144 61861))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps-geocode.el

(autoload 'google-maps-geocode-replace-region "google-maps-geocode" "\
Geocode region and replace it with a more accurate result.

\(fn BEG END)" t nil)

;;;***

;;;### (autoloads (google-maps-static-mode) "google-maps-static"
;;;;;;  "../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps-static.el"
;;;;;;  (20144 61861))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps-static.el

(autoload 'google-maps-static-mode "google-maps-static" "\
A major mode for Google Maps service

\(fn)" t nil)

;;;***

;;;### (autoloads (js2-mode) "js2" "../lazy-loaded/js2.el" (20137
;;;;;;  5384))
;;; Generated autoloads from ../lazy-loaded/js2.el
 (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'js2-mode "js2" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

;;;***

;;;### (autoloads (magit-status) "magit" "../lazy-loaded/magit.el"
;;;;;;  (20137 5385))
;;; Generated autoloads from ../lazy-loaded/magit.el

(autoload 'magit-status "magit" "\
Not documented

\(fn DIR)" t nil)

;;;***

;;;### (autoloads (print-project-definition get-project-definition
;;;;;;  project-root-path) "projects" "../../../../.emacs.d/lazy-loaded/projects.el"
;;;;;;  (20142 56163))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/projects.el

(autoload 'project-root-path "projects" "\
Locate the project root, as identified by files in project-root-files.

\(fn &optional FILE-NAME)" nil nil)

(autoload 'get-project-definition "projects" "\
Locate a project definition file, if any, and read it; if none exists, prompts

\(fn F &optional FORCE-RELOAD)" nil nil)

(autoload 'print-project-definition "projects" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (rename-file-and-buffer) "rename-file-and-buffer"
;;;;;;  "../../../../.emacs.d/lazy-loaded/third-party/rename-file-and-buffer.el"
;;;;;;  (20140 36837))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/third-party/rename-file-and-buffer.el

(autoload 'rename-file-and-buffer "rename-file-and-buffer" "\
Renames both current buffer and file it's visiting to NEW-NAME.

\(fn NEW-NAME)" t nil)

;;;***

;;;### (autoloads (traverse-accessible-dirs string-matches-regex-list)
;;;;;;  "traverse-accessible-dirs" "../../../../.emacs.d/lazy-loaded/traverse-accessible-dirs.el"
;;;;;;  (20142 22271))
;;; Generated autoloads from ../../../../.emacs.d/lazy-loaded/traverse-accessible-dirs.el

(autoload 'string-matches-regex-list "traverse-accessible-dirs" "\
Returns t if str matches one of the regexes in list.

\(fn STR LST)" nil nil)

(autoload 'traverse-accessible-dirs "traverse-accessible-dirs" "\
Traverse accessible, non-blacklisted directories under root. If nil,

\(fn ROOT CALLBACK &optional BLACKLIST PREORDER MAX-DEPTH)" nil nil)

;;;***

;;;### (autoloads (areusch-assoc-delete string-find-and-replace string-begins-with
;;;;;;  list-contains-string) "util" "../lazy-loaded/util.el" (20137
;;;;;;  5385))
;;; Generated autoloads from ../lazy-loaded/util.el

(autoload 'list-contains-string "util" "\
Returns t if str is in lst.

\(fn LST STR)" nil nil)

(autoload 'string-begins-with "util" "\
Returns nil if str does not begin with prefix

\(fn STR PREFIX)" nil nil)

(autoload 'string-find-and-replace "util" "\
Replace occurences of regexp with replace-with in string

\(fn STRING REGEXP REPLACE-WITH)" nil nil)

(autoload 'areusch-assoc-delete "util" "\
Delete all elements from alist whose car is `equal` to key. Returns the
   modified alist.

\(fn ALIST KEY)" nil nil)

;;;***

;;;### (autoloads (yank-push) "yank-push" "../lazy-loaded/yank-push.el"
;;;;;;  (20137 5385))
;;; Generated autoloads from ../lazy-loaded/yank-push.el

(autoload 'yank-push "yank-push" "\
Replace the just-yanked text with the text yanked just before it.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/lazy-loaded/c-gen.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/c-switch-decl-impl.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/count-words-region.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/go-mode.el" "../../../../.emacs.d/lazy-loaded/js2.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/json.el" "../../../../.emacs.d/lazy-loaded/kill-buffers-in-dir.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/magit.el" "../../../../.emacs.d/lazy-loaded/projects.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps-base.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps-geocode.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps-static.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/third-party/google-maps/google-maps.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/third-party/google-maps/org-location-google-maps.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/tramp-projects.el" "../../../../.emacs.d/lazy-loaded/traverse-accessible-dirs.el"
;;;;;;  "../../../../.emacs.d/lazy-loaded/util.el" "../../../../.emacs.d/lazy-loaded/yank-push.el")
;;;;;;  (20178 61783 594220))

;;;***

(provide 'autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; autoloads.el ends here
