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
;; (setq-default indent-tabs-mode nil)
;; (setq tab-width 4)
;; (setq c-basic-indent 4)
;; (setq c-basic-offs)


;; theme
;;(load-theme 'inkpot t)


;; PC style selection
;;(pc-selection-mode 1)

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
(setq major-mode 'text-mode)

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
(setq ispell-local-dictionary "british")

;; This is when I tried my own custom Kn dictionary
;; (setq ispell-local-dictionary "kannada")

