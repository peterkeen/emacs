(defalias 'qrr 'query-replace-regexp)
(defalias 'sir 'string-insert-rectangle)

(defun rirc ()
  (interactive)
  (setq erc-prompt-for-nickserv-password nil)
  (setq erc-nick-identify-mode 'autodetect)
  (setq erc-nickserv-passwords
        '((RTK (("Pete" . "12345678")))))
  (setq erc-nickserv-alist
               '(RTK
                 "NickServ!ircservice@rentrak.com"
                 "This nickname is registered and protected"
                 "NickServ"
                 "IDENTIFY"
                 nil
                 ))

  (erc :server "irc.rtkinternal" :port 6667 :nick "Pete" :full-name "Pete Keen" :password "12345678"))

(provide 'pak-aliases)