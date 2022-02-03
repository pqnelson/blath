;; Update this to wherever the blath directory is located.
(defvar blath-dir "~/src/blath/")

(defun count-blath-files ()
  (length (directory-files (concat blath-dir "tex/") nil "\\.tex\\'")))

;; Create a new file, following the convention of "\d{3}-\w+.tex" or so.
(defun blath ()
  (interactive)
  (let ((string (read-string "New file name: " nil)))
    (find-file (concat blath-dir "tex/"
                       (format "%03d" (1+ (count-blath-files)))
                       "-"
                       string
                       ".tex"))))
