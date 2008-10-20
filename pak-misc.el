(defun google-search(search)
  (interactive "MSearch for: ")
  (shell-command (concat "google.pl " search)))

(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file (ido-completing-read "Project file: "
                         (tags-table-files)
                         nil t))))

(defun interactive-shell-command-on-region(command)
  "Replace the selected region with the results from command"
  (interactive "MCommand: ")
  (save-excursion
    (shell-command-on-region (region-beginning) (region-end) command nil t)))

(defun perl-on-region(perl-expression)
  "Run the given expression as 'perl -pe perl-expression'"
  (interactive "MPerl expression: ")
  (interactive-shell-command-on-region (concat "perl -pe '" perl-expression "'")))

(defun pwd-of-buffer(buffer)
  (interactive "MBuffer: ")
  (save-excursion
    (set-buffer buffer)
    (message default-directory)))

(defun toggle-todo-item ()
  "Toggle a todo item in the form of '[ ] blah' or '[X] foo'"
  (interactive)
  (save-excursion
    (move-beginning-of-line nil)
    (re-search-forward "\\[")
    (if (looking-at "X")
        (progn
          (delete-char 1)
          (insert " "))
      (delete-char 1)
      (insert "X"))))

(defun insert-todo-item ()
  "Insert a todo item on a new line below point with the current indent level."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent)
  (insert "[ ] "))

(defun shell-command-as-string (command)
  "Call a command and return output as a string."
  (with-temp-buffer
    (shell-command command (current-buffer))
    (buffer-string)))

(defun sh1 ()
  (interactive)
  (my-shell 1))

(defun sh2 ()
  (interactive)
  (my-shell 2))

(defun my-shell (arg)
  (interactive "p")
  (let ((arg (or arg 1)))
    (shell (format "*sh%d*" arg))))

(defun my-shell-interactively (arg)
  (interactive "nSwitch to sh #:")
  (my-shell arg))

(defun chomp (str)
  "Chomp a string"
  (let ((s (if (symbolp str)(symbol-name str) str)))
    (save-excursion
      (while (and
              (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
              (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
        (setq s (replace-match "" t nil s)))
      (while (and
              (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
              (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
        (setq s (replace-match "" t nil s))))
    s))

(defun current-hostname ()
  (interactive)
  (with-temp-buffer
    (shell-command "hostname" (current-buffer))
    (chomp (buffer-string))))

(defun load-host-specific-configuration (hostname)
  (let ((host-specific-file (concat emacsd-path "/hosts/" hostname ".el")))
    (if (file-exists-p host-specific-file)
        (load host-specific-file))))

(require 'cl)

(defun duration (time)
  "Takes in a time-value and returns the number of seconds since
   the epoch that value represents."
  (+ (* 65536 (car time)) (cadr time)))

(defun uptime ()
  "Prints the current uptime of Emacs as recorded on startup in
   the value 'start-time'"
  (interactive)
  (let* ((total (duration (time-subtract (current-time) start-time)))
         (days  (floor (/ total 86400)))
         (hours (progn (decf total (* days  86400)) (floor (/ total 3600))))
         (mins  (progn (decf total (* hours 3600))  (floor (/ total 60))))
         (secs  (progn (decf total (* mins  60))    (floor total))))
    (message "%d days, %d hours, %d minutes, %d seconds" days hours mins secs)))

(provide 'pak-misc)