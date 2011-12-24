;; --------------------------------------------------
;; ERC Notifications
;; --------------------------------------------------
(defun notify-erc (match-type nickuserhost message)
  (interactive)
  "Notify when a message is received."
  (notify (format "%s in %s"
                  ;; Username of sender
                  (car (split-string nickuserhost "!"))
                  ;; Channel
                  (or (erc-default-target) "#unknown"))
          ;; Remove duplicate spaces
          (replace-regexp-in-string " +" " " message)
          :icon "emacs"
          :timeout -1))

(add-hook 'erc-text-matched-hook 'notify-erc)

;; -------------------------------------------------------------------
;; ERC Start Function
;; -------------------------------------------------------------------
(defun start-erc()
  (interactive)
  (require 'erc)
  ;; Load secrets
  ;; (require 'secrets)
  ;; (erc :server "irc.oftc.net" :port 6667 :password erc-password)
  
  ;; Use the following if you want SSL but this may not work with Tor! 
  (erc-tls :server "irc.oftc.net" :port 6697
        :nick "vasudev" :full-name "Vasudev Kamath")
  (setq erc-autojoin-channels-alist
     '(("irc.oftc.net","#debian-in","#nitte" "#debian-in-mentors"))))


;;-------------------------------------------------
;;  ERC Configuration Customization
;;-------------------------------------------------
(setq erc-email-userid "kakashi")
(setq erc-enable-logging t)
(setq erc-user-full-name "Vasudev Kamath")
(setq erc-log-channels-directory "~/.erc/logs/")
(setq erc-save-buffer-on-part t)
(add-hook 'erc-insert-post-hook 'erc-save-buffer-in-logs)

;; Socks for Erc to be used with tor
;; (setq socks-override-functions 1)
;; (setq socks-noproxy '("localhost"))
;; (require 'socks)
;; (defalias 'open-network-stream 'socks-open-network-stream)
;; the following works for just ERC
;; (setq erc-server-connect-function 'socks-open-network-stream)

;; ERC with SSL
(require 'tls)
(setq tls-program '("openssl s_client -connect %h:%p -no_ssl2 -ign_eof \
                                       -CAfile /home/vasudev/.erc/certs/CAs.pem -cert /home/vasudev/.erc/certs/vasudev.pem"
                    "gnutls-cli --priority secure256 \
                                 --x509cafile /home/vasudev/.erc/certs/CAs.pem \
                                 --x509certfile /home/vasudev/.erc/certs/vasudev.pem -p %p %h" ))

;; -------------------------------------------------
;;  ERC Custom Variables
;; -------------------------------------------------
(custom-set-variables
 '(erc-nick-uniquifier "_")
 '(erc-server nil))