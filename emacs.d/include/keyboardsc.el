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
(global-set-key (kbd "s-s") 'openScratch)
(global-set-key [f11] 'fullscreen)
