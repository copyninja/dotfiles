(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(notmuch-address-command "notmuch-addrlookup")
 '(notmuch-always-prompt-for-sender t)
 '(notmuch-crypto-process-mime t)
 '(notmuch-fcc-dirs
   '(("vasudev-debian@copyninja.in" . "vasudev-debian/Sent")
     ("vasudev@debian.org" . "vasudev-debian/Sent")
     ("vasudev@copyninja.in" . "vasudev/Sent")
     ("kamathvasudev@gmail.com" . "Gmail-1/Sent")))
 '(notmuch-hello-tag-list-make-query "tag:unread")
 '(notmuch-message-headers '("Subject" "To" "Cc" "Bcc" "Date" "Reply-To"))
 '(notmuch-saved-searches
   '((:name "debian-devel" :query "folder:vasudev-debian/debian-devel and tag:unread")
     (:name "debian-fonts" :query "folder:vasudev-debian/debian-fonts and tag:unread")
     (:name "debian-india" :query "folder:vasudev-debian/debian-india and tag:unread")
     (:name "debian-devel-announce" :query "folder:vasudev-debian/debian-devel-announce and tag:unread")
     (:name "Plan9 and 9Front" :query "folder:vasudev/9fans and and folder:vasudev/9front and tag:unread")
     (:name "rkrishnan" :query "folder:vasudev/rkrishnan and tag:unread")
     (:name "rrs" :query "folder:vasudev/rrs and tag:unread")
     (:name "Gmail/INBOX" :query "folder:Gmail-1/INBOX and tag:unread")
     (:name "vasudev/INBOX" :query "folder:vasudev/INBOX and tag:unread")
     (:name "vasudev-debian/INBOX" :query "folder:vasudev-debian/INBOX and tag:unread")
     (:name "debian-project" :query "folder:vasudev-debian/debian-project and tag:unread")
     (:name "libindic-dev" :query "folder:vasudev/libindic-dev and tag:unread")
     (:name "TODO" :query "tag:TODO")
     (:name "debian-rust" :query "folder:vasudev-debian/pkg-rust and tag:unread")
     (:name "Tahoe Development" :query "folder:vasudev/tahoe-dev and tag:unread")
     (:name "debian-backports" :query "folder:vasudev-debian/debian-backports and tag:unread")
     (:name "pkg-libvirt" :query "folder:vasudev-debian/pkg-libvirt and tag:unread")
     (:name "Intrigeri conversations" :query "folder:vasudev/nm-process and tag:unread")
     (:name "Debian Multimedia (my packages)" :query "folder:vasudev-debian/pkg-multimedia and tag:unread and ( subject:(rem.*):.* or subject:(librem.*):.* )")
     (:name "Debian VoIP (my packages)" :query "folder:vasudev-debian/pkg-voip and tag:unread and subject:(*libre*):.* or subject:(baresip*):.* or subject:(biboumi*):.*")))
 '(notmuch-search-line-faces
   '(("deleted" :foreground "red")
     ("unread" :weight bold)
     ("flagged" :foreground "blue")))
 '(notmuch-search-oldest-first nil)
 '(notmuch-show-all-multipart/alternative-parts nil)
 '(notmuch-show-all-tags-list t)
 '(notmuch-show-insert-text/plain-hook
   '(notmuch-wash-convert-inline-patch-to-part notmuch-wash-tidy-citations notmuch-wash-elide-blank-lines notmuch-wash-excerpt-citations))
 '(package-selected-packages '(rustic salt-mode systemd notmuch dpkg-dev-el))
 '(safe-local-variable-values '((c-indent-level . 4)))
 '(send-mail-function 'smtpmail-send-it)
 '(smtpmail-smtp-server "localhost")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))
