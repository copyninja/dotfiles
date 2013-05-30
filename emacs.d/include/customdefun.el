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

;; To work in full screen mode
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
;; Open my todo file
(defun openTODO ()
  (interactive)
  (find-file "~/.emacs.d/todo.org"))

(defun hexcolour-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))


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

;; clear function for eshell
(defun eshell/clear()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; Python3 customization
(setq python3-executable "python3")

(defun python3-shell()
  (interactive)

  ;; explicit-shell-file-name if non nil it will be used by M-x shell
  ;; as shell to be executed
  (setq explicit-shell-file-name
        python3-executable)

  ;; Now launch shell (Python3)
  (shell)

  ;; Lets have Python3 as name
  (rename-buffer "*Python3*")

  ;; Now reset the variable I don't want to mess around
  (setq explicit-shell-file-name nil))

(defun run-python3(script-file)
  ;; Gee I don't know how this works nor I know this is how we take input
  ;; D goes for Directory and I threw a stone in dark thinking f takes file
  ;; and it did take file name!..
  ;; Now don't ask me how the file-name gets assigned to script-file symbol
  ;; I don't have a clue!

  (interactive "fScript Name: ")
  (let (
        ;; Output buffer
        ( python-output "Python3-Output"))
    ;; Split winows vertically
    (split-window-vertically)
    ;; move to down part of split windows
    (windmove-down)

    ;; now create and change to buffer
    (switch-to-buffer (get-buffer-create python-output))

    ;; Insert the output to buffer!
    (insert (apply #'call-process python3-executable nil t nil (list script-file)))))

