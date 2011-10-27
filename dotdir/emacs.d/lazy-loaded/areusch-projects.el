;; Copyright 2010 (C) Andrew Reusch
;;
;; Project Management System for projects by Andrew Reusch
;;
;; Provides the concept of a "root directory" which is useful for
;; generating relative paths within projects.

(require 'json)

(defconst areusch-project-definition-filename ".eproject")

(defvar areusch-project-root-files '(("configure.ac" "README" "NEWS" "COPYING" "ChangeLog") areusch-project-definition-filename "SConstruct"))

(defvar areusch-project-definitions '())

(defun areusch-display-project-root-path ()
  "Display a message with the current project's root path. Useful for debugging."
  (interactive)
  (message (areusch-project-root-path)))

(defun areusch-project-root-path-recurse (dir file-name-table)
  "Recurses up the path to the current buffer until the project root is discovered.
   Returns the project root, or nil if none is found!"
  (if (equal dir "/")
      nil
    (if (equal file-name-table nil)
	(areusch-project-root-path-recurse (expand-file-name ".." dir) areusch-project-root-files)
      (if (stringp (car file-name-table))
	  (if (file-exists-p (expand-file-name (car file-name-table) dir))
	      dir
	    (areusch-project-root-path-recurse dir (cdr file-name-table)))
	(if (equal (car file-name-table) nil)
	    dir
	  (if (file-exists-p (expand-file-name (caar file-name-table) dir))
	      (areusch-project-root-path-recurse dir (cons (cdr (car file-name-table)) (cdr file-name-table)))
	    (areusch-project-root-path-recurse dir (cdr file-name-table))))))))

;;;###autoload
(defun areusch-project-root-path (&optional file-name)
  "Locate the project root, as identified by files in areusch-project-root-files."
  (if (equal file-name nil)
      (if (equal (buffer-file-name) nil)
          nil
        (areusch-project-root-path (buffer-file-name)))
    (let ((start-directory (if (file-directory-p file-name)
                               file-name
                             (file-name-directory file-name))))
      (areusch-project-root-path-recurse start-directory areusch-project-root-files))))

(defun areusch-gen-project-definition (d)
  "Generate a project definition for the project starting at the given root dir."
  '())

(defun areusch-get-project-definition-file (f)
  "Locate the project definition file, if any. Returns nil if no project root was "
  "found."
  (let ((root-dir (areusch-project-root-path)))
    (if (eq root-dir nil)
        nil
      (concat (directory-file-name root-dir)
              "/"
              areusch-project-definition-filename))))

;;;###autoload
(defun areusch-get-project-definition (f &optional force-reload)
  "Locate a project definition file, if any, and read it; if none exists, prompts "
  "the user to specify a project root, and creates one."
  (let ((project-definition-file (areusch-get-project-definition-file f)))
    (if (eq project-definition-file nil)
        (progn
          (message "Project root not found!")
          nil)
      (let ((existing-def (assoc project-definition-file areusch-project-definitions)))
        (if (and force-reload existing-def)
            (setq areusch-project-definitions
                  (areusch-assoc-delete areusch-project-definitions project-definition-file)))
        (if (or (not existing-def) force-reload)
            (progn
              (if (file-exists-p project-definition-file)
                  (let ((config (condition-case nil
                                    (json-read-file project-definition-file) (error nil))))
                    (if (eq config nil)
                        (push (cons project-definition-file nil) areusch-project-definitions)
                      (push (cons project-definition-file config) areusch-project-definitions)))
                (push (cons project-definition-file nil) areusch-project-definitions))))
        (cdr (assoc project-definition-file areusch-project-definitions))))))

;;;###autoload
(defun areusch-print-project-definition ()
  ""
  (interactive)
  (message "PRD")
  (print (areusch-get-project-definition (buffer-file-name) t)) t)

(defun areusch-write-project-definition (f)
  "Write the given project definition to its project defintion file."
  (let* ((project-definition (areusch-get-project-definition f))
         (project-definition-file (areusch-get-project-defintion-file f))
         (encoded-definition (json-encode project-definition)))
    (with-temp-buffer
      (insert encoded-definition)
      (if (not (file-writable-p project-definition-file))
          (error "Definition file %s not writable!" project-definition-file)
        (write-region (point-min) (point-max) project-definition-file)))))
