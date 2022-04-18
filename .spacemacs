;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-additional-packages '(
                                      notmuch
                                      notmuch-labeler
                                      bbdb
                                      smtpmail-multi)
   dotspacemacs-configuration-layers
   '(php
     javascript
     systemd
     sml
     ruby
     csv
     ansible
     graphviz
     html
     lua
     lsp
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (ranger :variables
             ranger-show-preview t)
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-enable-org-journal-support t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell
            shell-enable-smart-eshell)
     spell-checking
     syntax-checking
     version-control
     (c-c++ :variables
            c-c++-enable-clang-support t)
     cscope
     (go :variables go-use-gometalinter t
         :variables gofmt-command "goimports")
     ;; gnus
     (python :variables python-backend 'lsp python-lsp-server 'pyright
             :variables python-formatter 'black)
     themes-megapack
     yaml
     rust
     notmuch
     cscope
     (treemacs :variables treemacs-use-scope-type 'Perspectives
               :variables treemacs-use-follow-mode 'tag)
     )
   dotspacemacs-excluded-packages '()))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 30
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'emacs
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '((recents . 5)
			 	(projects . 7))
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(material-light
                         solarized-light
                         solarized-dark
                         subatomic
                         material
                         zenburn
                         spacemacs-light
                         leuven
                         monokai
                         misterioso
                         )
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("monofur"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'top
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server t
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'changed
   dotspacemacs-install-packages 'used-but-keep-unused
   ))

(defun dotspacemacs/user-init ()
  (setq user-mail-address "vasudev@copyninja.info")
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq custom-file "~/.custom.el")

  (defun copyninja/display-config ()
    (setq display-time-24hr-format t
          display-time-default-load-average nil)
    (display-time-mode)
    (fancy-battery-mode))

  (defun pelican-config()
    (defun insert-pelican-date()
      (interactive)
      (goto-char (point-min))
      (if (re-search-forward ":date: \\(.+\\)")
          (replace-match (format ":date: %s"
                                 (format-time-string "%Y-%m-%d %R %z")))))
    (require 'rst)
    (define-key rst-mode-map (kbd "<f1>") 'insert-pelican-date))
  )

(defun ox-reveal-config()
  (require 'ox-reveal)
  (setq org-reveal-root "file:///home/vasudeva.sk/Documents/talks/reveal.js/")
  )

(defun dotspacemacs/user-config ()
  (copyninja/display-config)
  (pelican-config)
  (setq ansible-vault-password-file "~/.secrets/.fip_token.txt")
 ;; (ox-reveal-config)
  )
