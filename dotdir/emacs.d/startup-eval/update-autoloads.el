(defun update-autoloads ()
  "Update the autoloads in the lazy-loaded directory."
  (interactive)
  (load-library "autoload")
  (let ((generated-autoload-file
         (file-truename (expand-file-name "~/.emacs.d/startup-eval/autoloads.el")))
	(directory-list nil))
    ;; (if (not (file-exists-p generated-autoload-file))
    ;; 	(with-temp-buffer
    ;; 	  (message "Writing autoload file")
    ;; 	  (write-file generated-autoload-file)))
    (traverse-accessible-dirs
     (file-truename (expand-file-name "~/.emacs.d/lazy-loaded"))
     (lambda (f)
       (if (not (file-accessible-directory-p f))
	   nil
	 (setq directory-list (cons f directory-list)))))
    (message "Updating autoloads for directory %s to %s" directory-list generated-autoload-file)
    (delete-file generated-autoload-file)
    (save-excursion
      (with-temp-buffer
        (write-region 1 1 generated-autoload-file)))
    (apply 'update-directory-autoloads directory-list)
    (load-file generated-autoload-file)))
