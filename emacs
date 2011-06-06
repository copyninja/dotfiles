;; -*- mode: lisp -*-
;;---------------------------------------
;; Add Path to look up lisp libraries
;;---------------------------------------
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/twittering-mode")
(add-to-list 'load-path "~/.emacs.d/site-lisp/js2")
(add-to-list 'load-path "~/.emacs.d/site-lisp/gist.el")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.6.1c")
(add-to-list 'load-path "~/.emacs.d/git-emacs")

;; Mutt to Mail mode
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))


;;----------------------------------------
;; Look and Feel
;;----------------------------------------

;; Show time
(display-time)

;; Column number display
(column-number-mode 1)

;; Line numbers
(global-linum-mode 1)

;; Disable tool bar and menu bar
;; Dunno what this does will see
(tool-bar-mode 0)

;(menu-bar-mode 0)

;; No startup messages please
(setq inhibit-startup-message t)

;; Space indentation
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq c-basic-indent 4)
(setq c-basic-offset 4)


;;------------------------------------------
;; Color themes
;;------------------------------------------

;; load my color themese
(load-file "~/.emacs.d/site-lisp/color-theme/zen-and-art.el")
(load-file "~/.emacs.d/site-lisp/color-theme/zenburn.el")

(require 'color-theme)
(color-theme-initialize)

;; My favourite
(color-theme-zenburn)

;; Clean up the minibuffer line
;; Clean up the status line (From emacs-fu)

(when (require 'diminish nil 'noerror)
(eval-after-load "company"
   '(diminish 'company-mode "Cmp"))
(eval-after-load "abbrev"
   '(diminish 'abbrev-mode "Ab"))
(eval-after-load "yasnippet"
   '(diminish 'yas/minor-mode "Y")))

;;------------------------------------------
;; Set up Environment Variable
;;------------------------------------------

;; User of this emacs
(setq user-full-name
      "Vasudev Kamath")
(setq user-mail-address
      "kamathvasudev@gmail.com")


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
(setq socks-override-functions 1)
(setq socks-noproxy '("localhost"))
(require 'socks)
;; === First alias open-network-stream function to socks-open-network-stream ===
;; (defalias 'open-network-stream 'socks-open-network-stream)

;; === the following works for just ERC ==
;; (setq erc-server-connect-function 'socks-open-network-stream)

;; ERC with SSL
(require 'tls)
(setq tls-program '("openssl s_client -connect %h:%p -no_ssl2 -ign_eof \
                                       -CAfile /home/vasudev/.erc/certs/CAs.pem -cert /home/vasudev/.erc/certs/vasudev.pem"
                    "gnutls-cli --priority secure256 \
                                 --x509cafile /home/vasudev/.erc/certs/CAs.pem \
                                 --x509certfile /home/vasudev/.erc/certs/vasudev.pem -p %p %h" ))



(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(android-jdb-command-name "adb")
 '(android-mode-sdk-dir "~/Documents/Android/android_sdk/android-sdk-linux_86")
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.32")
 '(erc-nick-uniquifier "_")
 '(erc-server nil)
 '(jabber-account-list (quote
                        (("xxx@jabber.org" (:port . 5222) (:connection-type . starttls))
                         ("xxx@gmail.com" (:network-server . "talk.google.com") (:connection-type . ssl))
                         ("xxx@gmail.com" (:network-server . "talk.google.com") (:connection-type . ssl)))))
 '(jabber-connection-ssl-program nil)
 '(jabber-default-show "")
 '(mml-secure-verbose t)
 '(org-enforce-todo-dependencies t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 ;; This for using tor
 '(socks-server (quote ("Default server" "localhost" 9050 5))))

;; PC style selection
(pc-selection-mode 1)

;; "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Save minibuffer history
(savehist-mode 1)

;; overwrite selection with typing
(delete-selection-mode 1)

;; replace selection when typing
(pending-delete-mode)

; enable mouse wheels
(mouse-wheel-mode t)

;; maximizing font coloration
(setq font-lock-maximum-decoration t)

;; syntax highlighting
(global-font-lock-mode t)

;; highlight the current line
(global-hl-line-mode t)
;; highlight matching parenthesis
(show-paren-mode t)

;; highlight the current selection
(transient-mark-mode t)

;; Encoding
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

;; Share the clipboard with X
(setq x-select-enable-clipboard t)

;; save position in files
(setq save-place t)

;; follow symlinks, don't ask
(setq vc-follow-symlinks t)

;; silence, no beeps
(setq visible-bell t)

;; no flashing
(setq ring-bell-function 'ignore)

;; delete line in one stage
(setq kill-whole-line t)

;; default mode
(setq default-major-mode 'text-mode)

;; paste at cursor NOT at mouse pointer position
(setq mouse-yank-at-point t)

;; calendar customizing
(setq european-calendar-style t)
(setq calendar-week-start-day 1)

;; autosave every 512 keyboard inputs
;; auto-save-interval 512

(setq transient-mark-mode t)

;; Don't want any backup files
(setq make-backup-files nil)    

;; Don't want any auto saving
(setq auto-save-default nil)    

;; Easy way to switch buffers
(iswitchb-mode 1)

;; To auto complete the mini buffer
(icomplete-mode 1)

;; remember my location, to open next time
(setq save-place-file "~/.emacs.d/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
(require 'saveplace)                          ;; get the package

;; When you say an todo is complete in org mode then log the time
(setq org-log-done 'time)

;; White space mode
(setq whitespace-style (quote (lines lines-tail)))
(global-whitespace-mode 1)


;; Dictionary location(Note Aspell needs to be installed)
(setq-default ispell-program-name "aspell")
(setq text-mode-hook '(lambda() 
						 (flyspell-mode t)       ; spellchek (sic) on the fly
						 ))

(setq html-mode-hook '(lambda() 
						 (flyspell-mode f)       
						 ))

;; Set which dict required, If not specified take default
;; (setq ispell-local-dictionary "british")

;; This is when I tried my own custom Kn dictionary
(setq ispell-local-dictionary "kannada")



;;------------------------------------------------
;; Plugin Customization
;;------------------------------------------------

;; Scratch buffer : mode specific
(autoload 'scratch "scratch" nil t)


;; Browse the Kill ring
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; PHP Mode
(require 'php-mode)

;; htmlize mode to export the files and buffers to
;; html file with color highlighting
(require 'htmlize)
(setq htmlize-output-type 'inline-css)

;; Yasnippet (Template system for emacs)
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")

;; Auto complete
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start 3)

;; Auto complete dictionary configuration
(when (require 'auto-complete-config nil 'noerror))
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(setq ac-comphist-file "~/.emacs.d/ac-comphist.dat")
(ac-config-default)

;; Markdown is wiki like Syntax
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; Auto pairing of brackets
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

;; Git for emacs
(require 'git-emacs)

;; Jabber for emacs
(require 'jabber-autoloads)

;; Twittering mode (OAuth twitter)
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; Android Support
(require 'android)
(require 'android-mode)


;; Highlight hex color code / named colors written in buffer
(require 'rainbow-mode)

;; Detects run time PHP error while typing
(require 'flymake)

;; Gist support
(require 'gist)

;; Lib Notify plugin
(require 'notify)

;; TLS Support
(require 'tls)

;; ------------------------------------------------------------------------
;; MailMode Customization
;; ------------------------------------------------------------------------

;; This is to send mail hit C-x m edit the message following smtp info is used to send
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials "~/.authinfo.gpg"
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "yourcompany.com")
;; Sign messages by default.
(add-hook 'message-setup-hook 'mml-secure-message-sign-pgpmime)
(add-hook 'mail-mode-hook 'turn-on-auto-fill)


;; ------------------------------------------------------------------------
;; Flymake Customization
;; ------------------------------------------------------------------------
;; Function for php flymake

(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy
                'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))



(add-to-list 'flymake-err-line-patterns
  '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))

;; Flymake for python
(when (load "flymake" t) 
       (defun flymake-pyflakes-init () 
         (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                            'flymake-create-temp-inplace)) 
            (local-file (file-relative-name 
                         temp-file 
                         (file-name-directory buffer-file-name)))) 
           (list "pyflakes" (list local-file)))) 

       (add-to-list 'flymake-allowed-file-name-masks 
                '("\\.py\\'" flymake-pyflakes-init))) 

(add-hook 'find-file-hook 'flymake-find-file-hook)



;; Drupal-type extensions
(add-to-list 'flymake-allowed-file-name-masks '("\\.module$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.install$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.inc$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.engine$" flymake-php-init))

(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))
(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)

;; -----------------------------------------------------------------------------



(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3f3f3f" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 90 :width normal :foundry "unknown" :family "FreeMono"))))
 '(js2-warning-face ((((class color) (background light)) (:underline "orange")))))

;; To refresh the browser for preview(Key is Ctrl + x p)
;; mozRepl plugin should be installed in Firefox
(require 'moz)
(global-set-key (kbd "C-x p")
                (lambda ()
                  (interactive)
                  (comint-send-string (inferior-moz-process)
                                     "BrowserReload();")))

;; -------------------------------------------------------------------
;; Different modes hook based on file extension
;; -------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(setq auto-mode-alist
    (append '(
        ("\\.pl$"           .       perl-mode)
        ("\\.cgi$"          .       perl-mode)
        ("\\.pm$"           .       perl-mode)
        ("\\.emacs$"        .       emacs-lisp-mode)
        ("\\.sh$"           .       ksh-mode)
        ("\\.html$"         .       html-mode)
        ("\\.tmpl$"         .       html-mode)
    )
auto-mode-alist))

(add-hook 'c-mode-hook 'imenu-add-menubar-index)
(add-hook 'php-mode-hook 'imenu-add-menubar-index)
(add-hook 'python-mode-hook 'imenu-add-menubar-index)
(add-hook 'html-mode-hook 'imenu-add-menubar-index)
(add-hook 'css-mode-hook 'imenu-add-menubar-index)

;; PO file editing features
(setq auto-mode-alist
      (cons '("\\.po\\'\\|\\.po\\." . po-mode) auto-mode-alist))
(autoload 'po-mode "po-mode" "Major mode for translators to edit PO file" t)

;; Tell emacs to automatically determine coding system and proper fonts
;; (modify-coding-system-alist 'file "\\.po\\'\\|\\.po\\."
;;                                  'po-find-file-coding-system)
;; (autoload 'po-find-file-coding-system "po-mode")



;; -------------------------------------------------------------------
;; Custom functions 
;; -------------------------------------------------------------------
;; From http://www.emacsblog.org/2007/01/17/indent-whole-buffer/
;; function to indent whole buffer
;; To use you need to type M-x iwb
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; Switch or create scratch buffer any time
(defun openScratch()
  (interactive)
  (switch-to-buffer "*scratch*"))

(global-set-key (kbd "s-s") 'openScratch)

;; To work in full screen mode
(defun fullscreen ()
   (interactive)
   (set-frame-parameter nil 'fullscreen
                        (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

(global-set-key [f11] 'fullscreen)

;; Open my todo file
(defun openTODO ()
  (interactive)
  (find-file "~/.emacs.d/todo.org"))


;; CSS color values colored by themselves
;; http://xahlee.org/emacs/emacs_html.html
(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background 
                     (match-string-no-properties 0)))))))

(defun hexcolour-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))

(add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)

;; -----------------------------------------------
;; Emacs jabber notifications
;; -----------------------------------------------

;; This is not required if you have notify.el (libnotify)
(defvar libnotify-program "/usr/bin/notify-send")

(defun notify-send (title message)
  (start-process "notify" " notify"
		 libnotify-program "--expire-time=6000" title message))

(defun libnotify-jabber-notify (from buf text proposed-alert)
  "(jabber.el hook) Notify of new Jabber chat messages via libnotify"
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buf))))
    (if (jabber-muc-sender-p from)
        (notify (format "(PM) %s"
                       (jabber-jid-displayname (jabber-jid-user from)))
               (format "%s: %s" (jabber-jid-resource from) text)))
      (notify (format "%s" (jabber-jid-displayname from))
             text)))

(add-hook 'jabber-alert-message-hooks 'libnotify-jabber-notify)

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



;; --------------------------------------------------------------------
;; Function to launch the console programs under emacs from emacs-fu.blogspot.com
;;---------------------------------------------------------------------
(defun term-start-or-switch (prg &optional use-existing)
  "* run program PRG in a terminal buffer. If USE-EXISTING is non-nil "
  " and PRG is already running, switch to that buffer instead of starting"
  " a new instance."
  (interactive)
  (let ((bufname (concat "*" prg "*")))
    (when (not (and use-existing
                 (let ((buf (get-buffer bufname)))
                   (and buf (buffer-name (switch-to-buffer bufname))))))
      (ansi-term prg prg))))

;; -------------------------------------------------------------------
;; Custom Macros
;; -------------------------------------------------------------------
(defmacro program-shortcut (name key &optional use-existing)
  "* macro to create a key binding KEY to start some terminal program PRG; 
    if USE-EXISTING is true, try to switch to an existing buffer"
  `(global-set-key ,key 
     '(lambda()
        (interactive)
        (term-start-or-switch ,name ,use-existing))))

;; -------------------------------------------------------------------
;; Keyboard Shortcuts
;; -------------------------------------------------------------------
;; Indent code when you hit enter
(global-set-key (kbd "RET") 'newline-and-indent)

;; get a buffer menu with the right mouse button.
(global-set-key (kbd "<mouse-3>") 'mouse-buffer-menu)

;; windmove: easily move between windows
(global-set-key (kbd "C-x <down>")  'windmove-down)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>")  'windmove-left)

;; Ctrl + z = undo
(global-set-key (kbd "C-z") 'undo)

;; switch to auto-fill mode (automatic word-wrapping) and back quickly.
; C-c q toggles auto-fill
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;; cycle through buffers with Ctrl-Tab and Ctrl-Shift-Tab
(global-set-key (kbd "<C-tab>") 'bury-buffer)
(global-set-key (kbd "<C-S-iso-leftab>") 'previous-buffer)
;; In org-mode, To export to html
(global-set-key (kbd "<f5>")  'org-export-as-html)
;; To list all emacs clipboard history
(global-set-key "\C-cy" '(lambda ()
                           (interactive)
                           (popup-menu 'yank-menu)))
(global-set-key (kbd "s-t") 'openTODO)
(global-set-key (kbd "s-~") 'start-erc)

;; Terminal Programs under Shift + Function key
(program-shortcut "mutt"  (kbd "<S-f2>") t)  ; mail client