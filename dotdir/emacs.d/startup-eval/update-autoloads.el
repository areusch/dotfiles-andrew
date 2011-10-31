(defun update-autoloads ()
  "Update the autoloads in the lazy-loaded directory."
  (interactive)
  (let ((generated-autoload-file
         (expand-file-name "~/.emacs.d/startup-eval/autoloads.el")))
    ;; (if (not (file-exists-p generated-autoload-file))
    ;; 	(with-temp-buffer
    ;; 	  (message "Writing autoload file")
    ;; 	  (write-file generated-autoload-file)))
    (traverse-accessible-dirs
     "~/.emacs.d/lazy-loaded"
     (lambda (f)
       (if (not (file-accessible-directory-p f))
	   nil
	 (message "Updating autoloads for directory %s" f)
         (condition-case nil (update-directory-autoloads f) ('error t)))))
    (load-file generated-autoload-file)))
