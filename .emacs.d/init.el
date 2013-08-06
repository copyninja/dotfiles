;; Copyright: (c) 2013, by copyninja

;; Emacs24 specific package archive config
;; setting this up first so that I can download proper packages from
;; the archive
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")
                          ("melpa" . "http://melpa.milkbox.net/packages/")))

;; First initialize ELPA
(package-initialize)

;; See if the archive is already read else hit the archives
(unless package-activated-list
  (package-refresh-contents))

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
         undo-tree
	 rainbow-delimiters
	 go-mode
	 go-autocomplete
	 go-eldoc
	 go-errcheck
	 go-play
	 go-snippets
	 smartparens)))

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
