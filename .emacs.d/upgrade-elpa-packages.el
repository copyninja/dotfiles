(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")
                          ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; refresh package list
(package-refresh-contents)

;; change to package-menu mode
(package-list-packages)

;; mark upgrades
(package-menu-mark-upgrades)

;; execute the action
(package-menu-execute)

