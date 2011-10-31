;;;###autoload
(defun string-matches-regex-list (str lst)
  "Returns t if str matches one of the regexes in list."
  (if (eq lst nil)
      nil
    (if (string-match (car lst) str)
        t
      (string-matches-regex-list str (cdr lst)))))


(defconst traverse-blacklist-template (list "^.*/\\.[^/]+$"))

(defun traverse-dir-is-suitable (d blacklist)
  ""
  (let ((basename (file-name-nondirectory d)))
    (and (file-accessible-directory-p d)
         (not (string-matches-regex-list d blacklist))
         (not (string= "." basename))
         (not (string= ".." basename)))))

(defun traverse-accessible-dirs-recurse (root f blacklist &optional preorder max-depth)
  ""
  (if (and (not (null max-depth)) (eq 0 max-depth))
      nil
    (if (and preorder (funcall f root))
        nil
      (dolist (child (directory-files root))
        (let ((child-absolute (concat root "/" child)))
          (if (traverse-dir-is-suitable child-absolute blacklist)
              (progn
                (traverse-accessible-dirs-recurse
                 child-absolute f blacklist preorder
                 (if (not (null max-depth)) (- max-depth 1) nil)))
            (if (and (or (file-regular-p child-absolute) (file-symlink-p child-absolute))
                     (not (file-directory-p child-absolute)))
                (funcall f child-absolute)))))
      (and (not preorder) (funcall f root)))))

;;;###autoload
(defun traverse-accessible-dirs (root callback &optional blacklist preorder max-depth)
  "Traverse accessible, non-blacklisted directories under root. If nil,"
  "blacklist defaults to any directory beginning with a period."
  (if (not (file-accessible-directory-p root))
      nil
    (let ((real-blacklist (if (eq blacklist nil) traverse-blacklist-template blacklist))
	  (expanded-dir (expand-file-name root)))
      (traverse-accessible-dirs-recurse expanded-dir callback real-blacklist preorder max-depth))))

