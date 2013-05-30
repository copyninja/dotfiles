;; Copyright: (c) 2013, by copyninja

;; Emacs24 specific package archive config
;; setting this up first so that I can download proper packages from
;; the archive
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")
                          ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Lets first initialize elpa to get list of installed packages
(package-initialize)
(package-refresh-contents)

;; Packages that I need
(setq packages-list
      (append
       '(
         auto-complete
         magit
         rainbow-mode
         elpy
         yasnippet
         solarized-theme
         inkpot-theme
         zenburn-theme
         zen-and-art-theme
         ipython
         popup
         php-mode
         highlight-80+
         dired+
         scratch
         rfringe
         autopair
         multi-term
         notify
         undo-tree)))

;; Install each package from ELPA/MELPA/Tromey etc.
(dolist (package packages-list)
  (if (not (member package package-activated-list))
        (package-install package)
    (message "%s is already installed" package)))

;; load up Org-mode and Org-babel
(require 'org-install)
(require 'ob) 
(require 'ob-tangle)
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(battery-mode-line-format "[%t%B %b%p%% %t]")
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("5339210234ec915d7d3fd87bfeb506bfc436ff7277a55516ab1781ec85c57224" default)))
 '(debian-bug-download-directory "~/.emacs.d/debbugs/")
 '(debian-bug-from-address "Vasudev Kamath <kamathvasudev@gmail.com>")
 '(debian-bug-helper-program (quote reporbug))
 '(display-battery-mode t)
 '(display-time-day-and-date t)
 '(font-lock-maximum-decoration t)
 '(fset (quote yes-or-no-p) t)
 '(globa-font-lock-mode t)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(mouse-wheel-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(user-full-name "Vasudev Kamath")
 '(user-mail-address "kamathvasudev@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
