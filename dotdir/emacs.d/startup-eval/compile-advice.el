(defvar areusch-saved-compilation-search-path nil)

(defadvice compile (around compile-set-lookup-dir ())
  "Find the project root, if any, and set compilation to look up paths from that dir."
  (let ((project-root (areusch-project-root-path))
         (config (areusch-get-project-definition (buffer-file-name))))
    (let ((new-compile-command (if (not (eq nil (assoc 'compile-command config)))
                                   (cdr (assoc 'compile-command config))
                                 compile-command)))
      (if (not (eq project-root nil))
          (progn
            (if (eq areusch-saved-compilation-search-path nil)
                (copy-tree compilation-search-path areusch-saved-compilation-search-path )
              (copy-tree areusch-saved-compilation-search-path compilation-search-path))
            (add-to-list 'compilation-search-path project-root)))
      (set (make-local-variable 'compile-command) new-compile-command)
      (ad-set-arg 0 new-compile-command)
      ad-do-it)))

(ad-activate 'compile)
(ad-deactivate 'compile)
