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



;; ---------------------------------------
;; Load split files
;; ---------------------------------------

(load-file "~/.emacs.d/include/customdefun.el")
(load-file "~/.emacs.d/include/custlookfeel.el")
(load-file "~/.emacs.d/include/customerc.el")
(load-file "~/.emacs.d/include/keyboardsc.el")


;; Mutt to Mail mode
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))


;;------------------------------------------
;; Set up Environment Variable
;;------------------------------------------

;; User of this emacs
(setq user-full-name
      "Your Name")
(setq user-mail-address
      "your.email@example.com")


;; Some custom variables

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
 '(jabber-account-list (quote (
                               ("xxx@jabber.org" (:port . 5222) (:connection-type . starttls))
                               ("xxx@gmail.com" (:network-server . "talk.google.com") (:connection-type . ssl))
                               ("xxx@gmail.com" (:network-server . "talk.google.com") (:connection-type . ssl)))))
 '(jabber-connection-ssl-program nil)
 '(jabber-default-show "")
 '(mml-secure-verbose t)
 '(org-enforce-todo-dependencies t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(socks-server (quote ("Default server" "localhost" 9050 5)))
 '(tool-bar-mode nil))

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

;; Rfringe
;; http://www.emacswiki.org/emacs/FlyMake
(require 'rfringe)

;; ------------------------------------------------------------------------
;; MailMode Customization
;; ------------------------------------------------------------------------

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
 '(default ((t (:inherit nil :stipple nil :background "#3f3f3f" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 98 :width normal :foundry "unknown" :family "FreeMono"))))
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



;; CSS color values colored by themselves
;; http://xahlee.org/emacs/emacs_html.html
(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background 
                     (match-string-no-properties 0)))))))

;; Functions come from include directory
(add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)

;; -----------------------------------------------
;; Emacs jabber notifications
;; -----------------------------------------------

(defvar libnotify-program "/usr/bin/notify-send")
(add-hook 'jabber-alert-message-hooks 'libnotify-jabber-notify)


;; SLIME - Stumpwm connection
(load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "sbcl")


