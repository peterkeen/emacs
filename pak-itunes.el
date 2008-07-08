(defun itunes-play-pause ()
  (interactive)
  (itunes-command "playpause")
  (message "Play/Pause"))

(defun itunes-next-track ()
  (interactive)
  (itunes-command "next"))

(defun itunes-prev-track ()
  (interactive)
  (itunes-command "previous"))

(defun itunes-track-info ()
  (interactive)
  (itunes-command "info"))

(defun itunes-volup ()
  (interactive)
  (itunes-command "volup"))

(defun itunes-voldown ()
  (interactive)
  (itunes-command "voldown"))

(defun itunes-command (command)
  (interactive "MiTunes Command: ")
  (shell-command
   (concat "itunes.sh " command)))

(provide 'pak-itunes)