(defvar saved-compilation-search-path nil)

(defadvice compile (around compile-set-lookup-dir ())
  "Find the project root, if any, and set compilation to look up paths from that dir."
  (let ((project-root (project-root-path))
         (config (get-project-definition (buffer-file-name))))
    (message "Root: %s" project-root)
    (let ((new-compile-command (if (not (eq nil (assoc 'compile-command config)))
                                   (cdr (assoc 'compile-command config))
                                 compile-command)))
      (if (not (eq project-root nil))
          (progn
            (if (eq saved-compilation-search-path nil)
                (copy-tree compilation-search-path saved-compilation-search-path )
              (copy-tree saved-compilation-search-path compilation-search-path))
            (add-to-list 'compilation-search-path project-root)))
      (set (make-local-variable 'compile-command) new-compile-command)
      (if (not (eq nil (assoc 'compile-from-root config)))
          (set 'new-compile-command (concat "cd " project-root " && " new-compile-command)))
      (message "New root: %s" new-compile-command)
      (ad-set-arg 0 new-compile-command)
      ad-do-it)))

(ad-activate 'compile)
