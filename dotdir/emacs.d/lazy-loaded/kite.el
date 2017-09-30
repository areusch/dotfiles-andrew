(defun alist-get-keys (alist)
  (if alist
      (cons (car (car alist)) (alist-get-keys (cdr alist)))))


(defgroup kite-cam nil "Settings for Kiteboarding Cams")

(defcustom kite-cam-list '(("upper-turf" . "http://arbor-studios.com/images/3rdave-flag.jpg")
                           ("jumping" . "http://arbor-studios.com/images/3rdave-jump.jpg")
                           ("lower-turf" . "http://arbor-studios.com/images/3rdave-lowlaunch.jpg")
                           ("north-launch" . "http://arbor-studios.com/images/3rdave-north.jpg")
                           ("channel-marker" . "http://arbor-studios.com/images/3rdave-marker.jpg")
                           ("lower-launch" . "http://arbor-studios.com/images/3rdave-beach.jpg")
                           ("upper-launch" . "http://arbor-studios.com/images/3rdave-uplaunch.jpg")
                           ("wide-angle" . "http://arbor-studios.com/images/3rdave-wide.jpg")
                           ("inktomi" . "http://arbor-studios.com/images/3rdave-inktomi.jpg")
                           ("upper-windsock" . "http://arbor-studios.com/images/3rdave-sockz.jpg")
                           ("parking-lot" . "http://arbor-studios.com/images/3rdave-pl.jpg")
                           ("flags" . "http://arbor-studios.com/images/3rdave-taflags.jpg")
                           ("pano" . "http://arbor-studios.com/images/p.jpg")
                           ("local" . "http://127.0.0.1:8000/test.jpg"))
  "An association list of the possible webcams to display"
  :type '(alist :key-type (string :tag "Cam Name") :value-type (string :tag "URL"))
  :group 'kite-cam)

(defcustom kite-default-cam "upper-launch"
  "The default camera in the autocomplete"
  :type 'string
  :options (alist-get-keys kite-cam-list))

(alist-get-keys kite-cam-list)

(defvar kite-last-request-number 0)

(defun kite-cancel-last-request ()
  (interactive)
  (setq kite-last-request-number (+ kite-last-request-number 1)))

(defun kite-display-image (status &rest args)
  (switch-to-buffer (current-buffer))
  (goto-char (point-min))
  (re-search-forward "^$")
  (delete-region (+ (point) 1) (point-min))
  (image-mode)
  (image-mode-fit-frame))

;;;###autoload
(defun kite ()
  (interactive)
  (let* ((cam (completing-read "Choose camera: " (alist-get-keys kite-cam-list) nil nil nil nil kite-default-cam))
         (url (cdr (assoc cam kite-cam-list))))
    (if (not url)
        (message "Unknown camera: %s" cam)
      (message "Downloading: %s" url)
      (kite-cancel-last-request)
      (url-retrieve url 'kite-display-image))))
