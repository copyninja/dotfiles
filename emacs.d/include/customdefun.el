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
