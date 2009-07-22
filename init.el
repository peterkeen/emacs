(setq start-time (current-time))

(setq emacsd-path "~/.emacs.d")

(setq load-path
      (append (list
               emacsd-path
               (concat emacsd-path "/vendor")) load-path))

(setq custom-file (concat emacsd-path "/customization.el"))
(load custom-file 'noerror)

(menu-bar-mode -1)
(display-time)
(tool-bar-mode -1)

(require 'pcomplete)
(require 'vc-git)
(require 'pak-macros)
(require 'pak-keybindings)
(require 'pak-filemodes)
(require 'pak-pager)
(require 'pak-mousewheel)
(require 'pak-misc)
(require 'pak-aliases)
(require 'pak-git)
(require 'emacs-lock)
(require 'game)
(require 'htmlize)
(require 'pak-itunes)
(require 'vline)
(require 'col-highlight)
(require 'browse-kill-ring)
(require 'protobuf-mode)

(setq sepia-perl5lib (list (expand-file-name "/dp/usr/pak/play/sepia/lib")))
(defalias 'perl-mode 'sepia-mode)
(require 'sepia)

(when (and (functionp 'server-running-p)
           (not (server-running-p)))
  (server-start))

;; disambiguous buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; Neat buffer switching
(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'ibuffer)
(setq ibuffer-enable t)
(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-expert t) 

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

(add-to-list 'default-frame-alist '(foreground-color . "LightGrey"))
(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(cursor-color . "red"))

(put 'upcase-region 'disabled nil)
(setq x-select-enable-clipboard t)

(put 'narrow-to-region 'disabled nil)

(setq cperl-hairy nil)

(if (file-exists-p "~/.emacs.local")
    (load "~/.emacs.local"))

