;; -*- mode: emacs-lisp -*-
;;---------------------------------------
;; Add Path to look up lisp libraries
;;---------------------------------------
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/gist.el")
(add-to-list 'load-path "~/.emacs.d/git-emacs")
(add-to-list 'load-path "~/.emacs.d/site-lisp/Hyde")


;; Initialize elpa folder stuff
(package-initialize)

;; ---------------------------------------
;; Load split files
;; ---------------------------------------

(load-file "~/.emacs.d/include/customdefun.el")
(load-file "~/.emacs.d/include/custlookfeel.el")
(load-file "~/.emacs.d/include/customerc.el")
(load-file "~/.emacs.d/include/keyboardsc.el")
(load-file "~/.emacs.d/include/programming.el")


;;------------------------------------------
;; Set up Environment Variable
;;------------------------------------------

;; User of this emacs
(setq user-full-name
      "Vasudev Kamath")
(setq user-mail-address
      "kamathvasudev@gmail.com")


;; Some custom variables

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "967c58175840fcea30b56f2a5a326b232d4939393bed59339d21e46cf4798ecf" "71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" "21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(display-time-mode t)
 '(ecb-options-version "2.32")
 '(erc-nick-uniquifier "_")
 '(erc-server nil)
 '(indent-tabs-mode nil)
 '(mml-secure-verbose t)
 '(org-enforce-todo-dependencies t)
 '(perl-indent-level 8)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;;------------------------------------------------
;; Plugin Customization
;;------------------------------------------------

;; Scratch buffer : mode specific
(autoload 'scratch "scratch" nil t)

;; Require multi-term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")

;; Browse the Kill ring
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; htmlize mode to export the files and buffers to
;; html file with color highlighting
(require 'htmlize)
(setq htmlize-output-type 'inline-css)


;; Auto complete
;;(require 'auto-complete)
;;(global-auto-complete-mode t)
;;(setq ac-auto-start 3)

;; Auto complete dictionary configuration
;;(when (require 'auto-complete-config nil 'noerror))
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;(setq ac-comphist-file "~/.emacs.d/ac-comphist.dat")
;;(ac-config-default)

;; Markdown is wiki like Syntax
(require 'markdown-mode)

;; Auto pairing of brackets
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

;; Git for emacs
(require 'git-emacs)
(require 'git-status)

;; Jabber for emacs
(require 'jabber-autoloads)

;; Android Support
(require 'android)
(require 'android-mode)


;; Highlight hex color code / named colors written in buffer
(require 'rainbow-mode)

;; Gist support
;(require 'gist)

;; Lib Notify plugin
(require 'notify)

;; TLS Support
(require 'tls)

;; Rfringe
;; http://www.emacswiki.org/emacs/FlyMake
(require 'rfringe)


;; Jekyll related configuration
(require 'hyde)

;; Elpy mode
;;(elpy-enable)

;; Message mode hook for mutt mails
(setq mail-header-separator "")                                                                                               
(add-hook 'message-mode-hook
          'turn-on-auto-fill
          (function (lambda ()                      
                      (progn
                        (local-unset-key "\C-c\C-c")
                        (define-key message-mode-map "\C-c\C-c" '(lambda ()
                                                                   "save and exit quickly"
                                                                   (interactive)
                                                                   (save-buffer)
                                                                   (server-edit)))))))

;; --------------------------------------------------
;; Enable yasnippet
;; --------------------------------------------------
;;(require 'yasnippet)
;; (yas-global-mode 1)
;;(yas--initialize)
;;(yas-minor-mode 1)

;; enable yas dropdown
;; (require 'dropdown-list)
;; (setq yas-prompt-functions '(yas-dropdown-prompt
;;                              yas-ido-prompt
                             ;; yas-completing-prompt))
;;(add-hook 'prog-mode-hook
;;          '(lambda ()
;;             (yas-minor-mode)))



;; Emacs24 specific package archive config
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")
                          ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Font faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "nil"))))
 '(js2-warning-face ((((class color) (background light)) (:underline "orange"))) t))
