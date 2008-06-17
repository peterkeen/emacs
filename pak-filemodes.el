;; actionscript modes
(setq auto-mode-alist
      (cons '("\\.as\\'" . java-mode) auto-mode-alist))

(setq auto-mode-alist
      (cons '("\\.js\\'" . javascript-generic-mode) auto-mode-alist))

(setq auto-mode-alist
      (cons '("\\.mxml\\'" . xml-mode) auto-mode-alist))

(setq auto-mode-alist
  (append
   ;; Make cperl-mode the default perl major mode
   '(("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
   auto-mode-alist))
(font-lock-add-keywords 'html-mode
 '(("\\[\\[[^]]+\\]\\]" . font-lock-keyword-face)))

(put 'downcase-region 'disabled nil)
(load-library "hideshow")
(add-hook 'cperl-mode-hook               ; other modes similarly
          '(lambda () (hs-minor-mode 1)))
(load-library "generic-x.el")

;; Javascript mode
;; Includes extra keywords from Armando Singer [asinger@MAIL.COLGATE.EDU]
(define-generic-mode 'javascript-generic-mode
  (list "//")
  (list
   "break"
   "case"
   "continue"
   "default"
   "delete"
   "do"
   "else"
   "export"
   "for"
   "function"
   "if"
   "import"
   "in"
   "new"
   "return"
   "switch"
   "this"
   "typeof"
   "var"
   "void"
   "while"
   "with"
   ;; words reserved for ECMA extensions below
   "catch"
   "class"
   "const"
   "debugger"
   "enum"
   "extends"
   "finally"
   "super"
   "throw"
   "try"
   ;; Java Keywords reserved by JavaScript
   "abstract"
   "boolean"
   "byte"
   "char"
   "double"
   "false"
   "final"
   "float"
   "goto"
   "implements"
   "instanceof"
   "int"
   "interface"
   "long"
   "native"
   "null"
   "package"
   "private"
   "protected"
   "public"
   "short"
   "static"
   "synchronized"
   "throws"
   "transient"
   "true"
   )
  (list
   (list "^\\s-*function\\s-+\\([A-Za-z0-9_]+\\)"
	  '(1 font-lock-function-name-face))
     (list "^\\s-*var\\s-+\\([A-Za-z0-9_]+\\)"
	      '(1 font-lock-variable-name-face))
     )
  (list "\\.js\\'")
  (list
   (function
    (lambda ()
      (setq imenu-generic-expression
	    '((nil "^function\\s-+\\([A-Za-z0-9_]+\\)" 1)
	      ("*Variables*" "^var\\s-+\\([A-Za-z0-9_]+\\)" 1)
	      ))
      ))
   (function
    (lambda ()
      (load-library "cc-mode")
      (make-local-variable 'indent-line-function)
      (setq indent-line-function 'c-indent-line)
      (c-set-style "gnu")
;;      (setq c-syntactic-indentation nil)
;;      (setq c-basic-offset 2)
      )))
  "Mode for JavaScript files.")

(provide 'pak-filemodes)