;;;###autoload
(defun list-contains-string (lst str)
  "Returns t if str is in lst."
  (if (eq lst nil)
      nil
    (length (filter-list lst (lambda (x) (string= str x))))))

;;;###autoload
(defun string-begins-with (str prefix)
  "Returns nil if str does not begin with prefix"
  (if (> (length prefix)  (length str))
      nil
    (let* ((str-prefix (substring str 0 (length prefix))))
      (if (string-equal prefix str-prefix)
          't
        nil))))

(defun string-find-and-replace-recurse (string regexp replace-with start-index)
  ""
  (let ((match-index (string-match regexp string start-index)))
    (if (not match-index)
	string
      (let ((replace-end-index (+ (- (length replace-with) (- (match-end 0) match-index)) match-index)))
	(string-find-and-replace-recurse (replace-match replace-with nil 't string) regexp replace-with replace-end-index)))))

;;;###autoload
(defun string-find-and-replace (string regexp replace-with)
  "Replace occurences of regexp with replace-with in string"
  (string-find-and-replace-recurse string regexp replace-with 0))

;;;###autoload
(defun areusch-assoc-delete (alist key)
  "Delete all elements from alist whose car is `equal` to key. Returns the
   modified alist."
  (while (and (consp (car alist))
	      (equal (car (car alist)) key))
    (setq alist (cdr alist)))
  (let ((tail alist) tail-cdr)
    (while (setq tail-cdr (cdr tail))
      (if (and (consp (car tail-cdr))
	       (eq (car (car tail-cdr)) key))
	  (setcdr tail (cdr tail-cdr))
	(setq tail tail-cdr))))
  alist)
