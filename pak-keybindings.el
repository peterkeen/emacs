;; key bindings
(global-set-key (kbd "M-\\") 'dabbrev-expand)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-w" 'kill-region)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z z") 'my-shell)
(global-set-key (kbd "C-z 1") '(lambda () (interactive) (my-shell 1)))
(global-set-key (kbd "C-z 2") '(lambda () (interactive) (my-shell 2)))
(global-set-key (kbd "C-z 3") '(lambda () (interactive) (my-shell 3)))
(global-set-key (kbd "C-z 4") '(lambda () (interactive) (my-shell 4)))
(global-set-key (kbd "C-z 5") '(lambda () (interactive) (my-shell 5)))

(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'join-line)
(global-set-key "\M-N" 'cyclebuffer-forward)
(global-set-key "\M-P" 'cyclebuffer-backward)
(global-set-key "\M-K" '(lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key (kbd "C-x C-p") 'ido-find-file-in-tag-files)

(global-set-key [f12] 'hs-toggle-hiding)

(global-set-key "\C-c l" 'open-tramp-path-on-line)

(global-set-key (kbd "C-c r") 'run-remote-command)
(global-set-key (kbd "C-c g") 'magit-status)

(global-set-key (kbd "C-c C-o") 'interactive-shell-command-on-region)
(global-set-key (kbd "C-c C-u") 'normal-mode)
(global-set-key (kbd "C-x C-g") 'keyboard-quit)
(global-set-key (kbd "C-c C-g") 'keyboard-quit)

(global-unset-key (kbd "C-c p"))
(global-set-key (kbd "C-c p") 'perl-on-region)

(global-unset-key (kbd "C-c TAB"))
(global-set-key (kbd "C-c TAB") 'toggle-todo-item)
(global-set-key (kbd "C-c C-j") 'insert-todo-item)
(global-set-key (kbd "C-c l") 'toggle-emacs-lock)




(provide 'pak-keybindings)