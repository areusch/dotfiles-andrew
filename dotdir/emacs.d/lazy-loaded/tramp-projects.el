(require 'tramp)

(defgroup tramp-projects nil
  "Convenient shorthand notation for accessing project workspaces."
  :group 'tramp
  :version "1.0")

(defcustom tramp-project-root-hints ()
  "List of directories containing project roots. At startup, tramp
will efficiently scan all files underneath each directory in the
list and add any project root to its inventory of projects."
  :type '(repeat string)
  :group 'tramp-projects)

(defcustom tramp-project-roots-max-depth 3
  "Maximum depth to scan under each root hint. This helps keep the
scan efficient."
  :group 'tramp-projects)

(defconst tramp-project-method "p")

(defvar tramp-project-roots-alist ()
    "Alist of all roots. Each cell contains (PROJECT_NAME . PATH)")

(defun tramp-project-scan-root (root)
  (let* ((true-root (expand-file-name root))
         (existing-entry (rassoc true-root tramp-project-roots-alist)))
    (if (not (null existing-entry))
        (car existing-entry)
      (traverse-accessible-dirs
       true-root
       (lambda (f)
         (let* ((true-f (expand-file-name f))
                (base-name (file-name-nondirectory (directory-file-name true-f))))
           (if (file-accessible-directory-p true-f)
               (let ((root-path (project-root-path true-f)))
                 (if (and (not (null root-path))
                          (equal root-path true-f))
                     (let* ((project-definition (get-project-definition true-f))
                            (project-shortname (assoc 'shortname project-definition))
                            (tramp-ref (if (or (null project-shortname))
                                           base-name (cdr project-shortname))))
                       (add-to-list
                        'tramp-project-roots-alist (cons tramp-ref true-f))
                       't))))))
       nil 't tramp-project-roots-max-depth))))

(defun tramp-project-rewrite-file-name (f)
  "Parse the tramp file name given, rewrite the localpath to a real path"
  (with-parsed-tramp-file-name f file
    (let ((tramp-project-root (assoc file-host tramp-project-roots-alist)))
      (if (null tramp-project-root)
          f
        (let ((rewritten-file-name (concat (cdr tramp-project-root) "/" file-localname)))
          rewritten-file-name)))))
(tramp-project-rewrite-file-name "/p:test:temp")

(defun tramp-project-file-name-p (f)
  "Check if f is a filename for local project mapping."
  (with-parsed-tramp-file-name f file
    (string= file-method tramp-project-method)))

(tramp-project-rewrite-file-name "/p:test:/tmp")

(defun tramp-project-file-name-handler (op &rest args)
  "Invoke op using args. Assumes the first argument is a filename "
  "and rewrites it using the project map."
  (let ((rewritten-file-name (tramp-project-rewrite-file-name (car args))))
    (tramp-run-real-handler op (cons rewritten-file-name (cdr args)))))

(defun tramp-project-complete (f)
  ""
  (let (lst)
  (dolist (root tramp-project-roots-alist lst)
    (setq lst (cons (list nil (car root)) lst)))))

(tramp-project-complete "")

(add-to-list 'tramp-foreign-file-name-handler-alist
             (cons 'tramp-project-file-name-p 'tramp-project-file-name-handler))
(add-to-list 'tramp-methods (cons tramp-project-method nil))
(add-to-list 'tramp-completion-function-alist
             (list "p" (list 'tramp-project-complete "")))

(defun tramp-project-rescan-roots ()
  "Rescan all roots in tramp-project-root-hints."
  (interactive)
  (dolist (root tramp-project-root-hints)
    (tramp-project-scan-root root)))

(add-hook 'custom-define-hook 'tramp-project-rescan-roots)

(provide 'tramp-projects)