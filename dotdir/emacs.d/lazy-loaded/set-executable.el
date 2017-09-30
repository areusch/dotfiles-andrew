;;;###autoload
(defun set-executable (&optional explicit-file-name)
  "Set the given file (or otherwise the current buffer's backing file)
   executable."
  (interactive)
  (let ((file-name (or explicit-file-name (buffer-file-name))))
    (if (not file-name)
	(message "Current buffer is not associated with a file!")
      (let ((file-mode (file-modes file-name)))
	(set-file-modes file-name (logior file-mode #o111))))))
