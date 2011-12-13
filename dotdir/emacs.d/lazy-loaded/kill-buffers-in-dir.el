;; Copyright (C) 2010 Andrew Reusch

;; Kill all buffers in a dir. Useful for closing out projects.
;;;###autoload
(defun kill-buffers-in-dir (&optional dir)
  "Kill buffers in specified dir. If dir unspecified, ask the user."
  (interactive)
  (let* ((insert-default-directory t)
	(dir-name (read-directory-name "Specify dir: ")))
    (when (not (file-name-absolute-p dir-name))
      (error "Enter an absolute file name!"))
    (let* ((true-dir-name (file-truename dir-name))
          (maybe-kill-buffer (lambda (buffer)
                               (let ((buffer-filename (buffer-file-name buffer)))
                                 (if (not buffer-filename)
                                     nil
                                   (if (not (string-begins-with (file-truename buffer-filename) true-dir-name))
                                       nil
                                     (if (buffer-modified-p buffer)
                                         (switch-to-buffer buffer))
                                     (kill-buffer buffer)
                                     nil))))))
      (mapc maybe-kill-buffer (buffer-list)))))

