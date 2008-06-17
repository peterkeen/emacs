;; pager

(defun ansi-color-apply-on-buffer ()
  "Apply the ansi-color filter to the current buffer"
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))

(defun pak-pager (filename)
  "Open a pager buffer on the filename specified"
  (find-file filename)
  (with-current-buffer
    (rename-buffer "*PAGER*" 1)
    (ansi-color-apply-on-buffer)
    (set-buffer-modified-p nil)
    (view-mode)))

(defun phil/fake-stdin-slurp (filename)
  "Emulate stdin slurp using emacsclient hack"
  (switch-to-buffer (generate-new-buffer "*stdin*"))
  (insert-file filename)
  (end-of-buffer))

(provide 'pak-pager)