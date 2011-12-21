(defun c-file-type (file-name)
      "Returns the parameter if it is a valid path to a c or c++
      source file, else nil"
      (let ((ext (downcase (file-name-extension file-name))))
	(if (or (equal ext "c")
		(equal ext "cc")
		(equal ext "cpp"))
	    'impl
	  (if (equal ext "h")
	      'decl
	    nil))))

(defun c-gen-maybe-insert-impl-header ()
  ""
  (if (not (equal (buffer-size) 0))
      (error "Buffer not empty")
    (let ((template-filename (convert-standard-filename "~/.emacsconfig/c-impl-template"))
	  (project-root-path (project-root-path)))
    (if (not (file-exists-p template-filename))
	(error (concat "Template file " template-filename " doesn't exist!"))
      (insert-buffer (find-file-noselect template-filename))
      (perform-replace "<<FILE_NAME>>" (file-name-nondirectory (buffer-file-name)) nil nil nil nil nil 0 (buffer-size))
      (perform-replace "<<HEADER_PATH>>" (concat (file-name-sans-extension (file-name-nondirectory (buffer-file-name))) ".h") nil nil nil nil nil 0 (buffer-size))))))

(defun c-gen-maybe-insert-decl-header ()
  ""
  (if (not (equal (buffer-size) 0))
      (error "Buffer not empty!")
        (let* ((template-filename (convert-standard-filename "~/.emacsconfig/c-decl-template"))
	      (project-root-path (project-root-path))
	      (define-prim (concat "_" (upcase (string-find-and-replace (file-relative-name (buffer-file-name)
										     project-root-path) "[\.\/\-]" "_")))))
	  (if (not (file-exists-p template-filename))
	      (error (concat "Template file " template-filename " doesn't exist!"))
	    (insert-buffer (find-file-noselect template-filename))
	    (perform-replace "<<FILE_NAME>>" (file-name-nondirectory (buffer-file-name)) nil nil nil nil nil 0 (buffer-size))
	    (perform-replace "<<DEFINE_GUARD_PATH>>" define-prim nil nil nil nil nil 0 (buffer-size))))))

;;;###autoload
(defun c-gen ()
      "Auto-generate C headers"
      (interactive)
      (let ((file-type (c-file-type (buffer-file-name))))
	(if (equal file-type 'impl)
	    (c-gen-maybe-insert-impl-header)
	  (if (equal file-type 'decl)
	      (c-gen-maybe-insert-decl-header)
	    (error "Not a c file")))))
