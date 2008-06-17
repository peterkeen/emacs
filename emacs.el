(setq emacsd-path "~/.emacs.d")

(setq load-path
      (append (list
               emacsd-path
               (concat emacsd-path "/vendor")) load-path))

(setq custom-file (concat emacsd-path "/customization.el"))
(load custom-file)

(menu-bar-mode)
(server-start)
(display-time)

(require 'pcomplete)
(require 'vc-git)
(require 'parenface)

(require 'pak-macros)
(require 'pak-keybindings)
(require 'pak-filemodes)
(require 'pak-pager)
(require 'pak-mousewheel)
(require 'pak-misc)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; disambiguous buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; Neat buffer switching
(ido-mode t)
(setq ido-enable-flex-matching t)

;; git stuff

(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
(require 'git)
(autoload 'git-blame-mode "git-blame"
          "Minor mode for incremental blame for Git." t)

(require 'ibuffer)
(setq ibuffer-enable t)
(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-expert t) 

(load-library "vc-hooks")

(add-to-list 'default-frame-alist '(foreground-color . "LightGrey"))
(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(cursor-color . "red"))

(put 'upcase-region 'disabled nil)
(setq x-select-enable-clipboard t)

(put 'narrow-to-region 'disabled nil)

(setq cperl-hairy nil)

(if (file-exists-p "~/.emacs.local")
    (load "~/.emacs.local"))
