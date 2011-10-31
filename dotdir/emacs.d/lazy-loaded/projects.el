;; Copyright 2010 (C) Andrew Reusch
;;
;; Project Management System for projects by Andrew Reusch
;;
;; Provides the concept of a "root directory" which is useful for
;; generating relative paths within projects.

(require 'json)

(defconst project-definition-filename ".eproject")

(defvar project-root-files (list (list "configure.ac" "README" "NEWS" "COPYING" "ChangeLog") project-definition-filename "SConstruct"))

(defvar project-definitions '())

(defun display-project-root-path ()
  "Display a message with the current project's root path. Useful for debugging."
  (interactive)
  (message (project-root-path)))

(defun project-root-path-p (dir file-names)
  ""
  (if (null file-names)
      nil
    (if (listp file-names)
        (let ((valid-root t))
          (dolist (f file-names valid-root)
            (set 'valid-root (and valid-root (file-exists-p (concat dir "/" f))))))
      (file-exists-p (concat dir "/" file-names)))))

(defun project-root-path-recurse (dir &optional file-name-table)
  "Recurses up the path to the current buffer until the project root is discovered.
   Returns the project root, or nil if none is found!"
  (if (equal dir "/")
      nil
    (if (equal file-name-table nil)
	(project-root-path-recurse dir project-root-files)
      (let ((is-root nil))
        (dolist (root-primitive file-name-table is-root)
          (set 'is-root (or is-root (project-root-path-p dir root-primitive))))
        (if is-root
            dir
          (project-root-path-recurse (expand-file-name ".." dir)))))))

;;;###autoload
(defun project-root-path (&optional file-name)
  "Locate the project root, as identified by files in project-root-files."
  (if (equal file-name nil)
      (if (equal (buffer-file-name) nil)
          nil
        (project-root-path (buffer-file-name)))
    (let ((start-directory (if (file-directory-p file-name)
                               file-name
                             (file-name-directory file-name))))
      (project-root-path-recurse start-directory))))

(defun gen-project-definition (d)
  "Generate a project definition for the project starting at the given root dir."
  '())

(defun get-project-definition-file (f)
  "Locate the project definition file, if any. Returns nil if no project root was "
  "found."
  (let ((root-dir (project-root-path f)))
    (if (eq root-dir nil)
        nil
      (concat (directory-file-name root-dir)
              "/"
              project-definition-filename))))

;;;###autoload
(defun get-project-definition (f &optional force-reload)
  "Locate a project definition file, if any, and read it; if none exists, prompts "
  "the user to specify a project root, and creates one."
  (let ((project-definition-file (get-project-definition-file f)))
    (if (eq project-definition-file nil)
        (progn
          (message "Project root not found!")
          nil)
      (let ((existing-def (assoc project-definition-file project-definitions)))
        (if (and force-reload existing-def)
            (setq project-definitions
                  (areusch-assoc-delete project-definitions project-definition-file)))
        (if (or (not existing-def) force-reload)
            (progn
              (if (file-exists-p project-definition-file)
                  (let ((config (condition-case nil
                                    (json-read-file project-definition-file) (error nil))))
                    (if (eq config nil)
                        (push (cons project-definition-file nil) project-definitions)
                      (push (cons project-definition-file config) project-definitions)))
                (push (cons project-definition-file nil) project-definitions))))
        (cdr (assoc project-definition-file project-definitions))))))

;;;###autoload
(defun print-project-definition ()
  ""
  (interactive)
  (message "PRD")
  (print (get-project-definition (buffer-file-name) t)) t)

(defun write-project-definition (f)
  "Write the given project definition to its project defintion file."
  (let* ((project-definition (get-project-definition f))
         (project-definition-file (get-project-defintion-file f))
         (encoded-definition (json-encode project-definition)))
    (with-temp-buffer
      (insert encoded-definition)
      (if (not (file-writable-p project-definition-file))
          (error "Definition file %s not writable!" project-definition-file)
        (write-region (point-min) (point-max) project-definition-file)))))
