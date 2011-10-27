(defun areusch-latex-go ()
  "Run latex"
  (interactive)
  (progn
    (TeX-save-document (TeX-master-file))
    (TeX-command "LaTeX" (quote TeX-master-file) -1)))

(defun areusch-latex-view ()
  "View latex"
  (interactive)
  (TeX-command "View" (quote TeX-master-file) -1))

(provide 'areusch-latex)