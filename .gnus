(setq smtpmail-auth-credentials "~/.authinfo.gpg")

(setq gnus-select-method '(nnimap "copyninja"
				  (nnimap-address "localhost")
				  (nnimap-stream network)
				  (nnimap-authenticator login)
				  (nnimap-inbox '("Gmail/INBOX"
						  "vasudev-copyninja.info/INBOX"
						  "vasudev-debian/INBOX"))
				  (nnimap-server-port 143)
				  (nnir-search-engine imap)
				  (nnimap-authinfo-file
				   "~/.authinfo.gpg")))

(setq gnus-thread-sort-functions
      '(
	(not gnus-thread-sort-by-date)
	(not gnus-thread-sort-by-number)
	))

(setq gnus-use-cache t)
(setq gnus-use-adoptive-scoring t)
(setq gnus-save-score t)
;; (add-hook 'mail-citation-hook 'sc-cite-original)

;; Don't clutter my home folder
(setq gnus-dribble-directory "~/.gnus.d/")

;; BBDB Address List
(when (file-exists-p "/usr/share/emacs/site-lisp/bbdb")
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/bbdb/lisp")
  (require 'bbdb)
  (bbdb-initialize 'message 'gnus 'sendmail)
  (setq bbdb-file "~/.bbdb.db")
  (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
  (setq bbdb/mail-auto-create-p t
	bbdb/news-auto-create-p t))

(add-hook 'message-mode-hook
	  '(lambda ()
	     (flyspell-mode t)
	     (local-set-key "<TAB>" 'bbdb-complete-name)))

(setq gnus-read-active-file 'some)

(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-subject)

;; Prefer only top level messages. If message has several replies or
;; is part of thread only show the first message.
(setq gnus-thread-hide-subtree t)
(setq gnus-thread-ignore-subject t)

;; Render html mail using w3m
(setq mm-text-html-render 'w3m)

;; Mail encryption/decryption/signing options
(setq mm-verify-option 'known)
(setq mm-decrypt-option 'always)
(setq mm-sign-option 'guided)
(setq mm-encrypt-option 'guided)

(setq gnus-use-correct-string-widths nil)
