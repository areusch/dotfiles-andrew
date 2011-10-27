(defvar areusch-c-impl-exts '("cc" "c" "cpp"))

(defun c-try-switch-to (base-file-name ext-list)
  "Try to swich to a buffer with one of the given file names."
  (if (or (equal base-file-name nil)
	  (equal ext-list nil))
      nil
    (let ((trial-filename (concat (file-name-sans-extension (buffer-file-name))
                               "."
                               (car ext-list))))
    (if (file-exists-p trial-filename)
	(find-file trial-filename)
      (c-try-switch-to base-file-name (cdr ext-list))))))

;;;###autoload
(defun c-switch-decl-impl ()
       "In C mode, switch to the buffer's header or implemenation."
       (interactive)
       (let ((ext (file-name-extension (buffer-file-name))))
         (bury-buffer (current-buffer))
	 (if (member ext areusch-c-impl-exts)
		 (find-file (concat (file-name-sans-extension
				     (buffer-file-name)) ".h"))
	(if (c-try-switch-to (file-name-sans-extension (buffer-file-name)) areusch-c-impl-exts)
	    't
	  (find-file (concat (file-name-sans-extension (buffer-file-name)) "." (car areusch-c-impl-exts)))))))

(require 'cc-mode)
(define-key c-mode-base-map (kbd "C-c C-/") 'c-switch-decl-impl)
