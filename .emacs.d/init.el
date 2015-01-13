;; No cursors please
(blink-cursor-mode 0)
(show-paren-mode 1)

;; Yes or no replaced by y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't want these
(setq make-backup-files nil)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; column number mode
(column-number-mode 1)

;; Don't hurt my ears
(setq visibile-bell t)

;; This is bound to f11 in Emacs 24.4
;; (toggle-frame-fullscreen)
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Who use the bar to scroll?
(progn
  (scroll-bar-mode 0)
  (tool-bar-mode 0)
  (menu-bar-mode 0))

;; my packages
(require 'package)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("stable-melpa" . "http://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives
;; 	     '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(auto-complete magit rainbow-mode rainbow-delimiters elpy
				   monokai-theme ample-theme zenburn-theme popup
				   go-mode rust-mode haskell-mode ghc debian-changelog-mode
				   debpaste rw-hunspell rw-ispell rw-language-and-country-codes w3m
				   flycheck smartparens debbugs ox-reveal dropdown-list slime
				   smtpmail-multi emms yasnippet))
;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(debian-bug-from-address "Vasudev Kamath <kamathvasudev@gmail.com>")
 '(debian-bug-download-directory "~/.emacs.d/debbugs/")
 '(debian-bug-helper-program (quote reporbug))
 '(user-full-name "Vasudev Kamath")
 '(user-mail-address "vasudev@copyninja.info")
 '(custom-safe-themes t))

;; Load theme
(load-theme 'monokai)

;; load up Org-mode and Org-babel
(require 'org-install)
(require 'ob) 
(require 'ob-tangle)
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(mapc #'org-babel-tangle-file (directory-files dotfiles-dir t "\\.org$"))

(require 'cl-lib)
(mapc #'load-file
      (cl-remove-if
       (lambda (file)
	 (or (string-match-p "\\init.el$" file)
	     (string-match-p "\\upgrade-elpa-packages.el$" file)))
       (directory-files dotfiles-dir t "\\.el$")))
