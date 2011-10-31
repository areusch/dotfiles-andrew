;;; tramp-projects.el --- Directory re-mapping for tramp.

;;; Copyright (C) 2011 Andrew Reusch <areusch@gmail.com>

;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.

;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.

;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; I typically have many projects open in Emacs at once. While keyboard
;;; shortcuts typically make it easy to switch buffers within the same project,
;;; my projects often have large directory hierarchies or are stored under large
;;; directory hierarchies, making it difficult to quickly switch to a buffer in
;;; another project.

;;; Tramp Projects makes it easy to address files by project name rather than
;;; path. After installation, you can express paths to your files in the form:

;;; /p:shortname:relative/path/from/project/root.html

;;; Typically this is much faster, for me, than deleting off the precise
;;; number of subdirectories from the current path in C-x C-f.

;;; Right now this is lightly bound (in tramp-project-scan-root) to my own
;;; project identification and configuration systems. It's not really intended
;;; to be widely distributed, but if you want to use it, send me mail and I'll
;;; see about packaging it in an easier-to-consume fashion.

;;; Code:

(require 'tramp)

(defgroup tramp-projects nil
  "Convenient shorthand notation for accessing project workspaces."
  :group 'tramp
  :version "1.0")

(defcustom tramp-project-root-hints ()
  "List of directories containing project roots. At startup, tramp
will efficiently scan all files underneath each directory in the
list and add any project root to its inventory of projects."
  :type '(repeat string)
  :group 'tramp-projects)

(defcustom tramp-project-roots-max-depth 3
  "Maximum depth to scan under each root hint. This helps keep the
scan efficient."
  :group 'tramp-projects)

(defconst tramp-project-method "p")

(defvar tramp-project-roots-alist ()
    "Alist of all roots. Each cell contains (PROJECT_NAME . PATH)")

(defun tramp-project-scan-root (root)
  (let* ((true-root (expand-file-name root))
         (existing-entry (rassoc true-root tramp-project-roots-alist)))
    (if (not (null existing-entry))
        (car existing-entry)
      (traverse-accessible-dirs
       true-root
       (lambda (f)
         (let* ((true-f (expand-file-name f))
                (base-name (file-name-nondirectory (directory-file-name true-f))))
           (if (file-accessible-directory-p true-f)
               (let ((root-path (project-root-path true-f)))
                 (if (and (not (null root-path))
                          (equal root-path true-f))
                     (let* ((project-definition (get-project-definition true-f))
                            (project-shortname (assoc 'shortname project-definition))
                            (tramp-ref (if (or (null project-shortname))
                                           base-name (cdr project-shortname))))
                       (add-to-list
                        'tramp-project-roots-alist (cons tramp-ref true-f))
                       't))))))
       nil 't tramp-project-roots-max-depth))))

(defun tramp-project-rewrite-file-name (f)
  "Parse the tramp file name given, rewrite the localpath to a real path"
  (with-parsed-tramp-file-name f file
    (let ((tramp-project-root (assoc file-host tramp-project-roots-alist)))
      (if (null tramp-project-root)
          f
        (let ((rewritten-file-name (concat (cdr tramp-project-root) "/" file-localname)))
          rewritten-file-name)))))
(tramp-project-rewrite-file-name "/p:test:temp")

(defun tramp-project-file-name-p (f)
  "Check if f is a filename for local project mapping."
  (with-parsed-tramp-file-name f file
    (string= file-method tramp-project-method)))

(tramp-project-rewrite-file-name "/p:test:/tmp")

(defun tramp-project-file-name-handler (op &rest args)
  "Invoke op using args. Assumes the first argument is a filename "
  "and rewrites it using the project map."
  (let ((rewritten-file-name (tramp-project-rewrite-file-name (car args))))
    (tramp-run-real-handler op (cons rewritten-file-name (cdr args)))))

(defun tramp-project-complete (f)
  ""
  (let (lst)
  (dolist (root tramp-project-roots-alist lst)
    (setq lst (cons (list nil (car root)) lst)))))

(tramp-project-complete "")

(add-to-list 'tramp-foreign-file-name-handler-alist
             (cons 'tramp-project-file-name-p 'tramp-project-file-name-handler))
(add-to-list 'tramp-methods (cons tramp-project-method nil))
(add-to-list 'tramp-completion-function-alist
             (list "p" (list 'tramp-project-complete "")))

(defun tramp-project-rescan-roots ()
  "Rescan all roots in tramp-project-root-hints."
  (interactive)
  (dolist (root tramp-project-root-hints)
    (tramp-project-scan-root root)))

(add-hook 'custom-define-hook 'tramp-project-rescan-roots)

(provide 'tramp-projects)