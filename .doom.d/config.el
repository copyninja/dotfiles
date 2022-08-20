;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Notmuch configuration
(after! notmuch

  (defun notmuch-hello-refresh-status-message ()
    (unless no-display
      (let* ((new-count
              (string-to-number
               (car (process-lines notmuch-command "count"))))
             (diff-count (- new-count notmuch-hello-refresh-count)))
        (cond
         ((= notmuch-hello-refresh-count 0)
          (message "You have %s messages."
                   (notmuch-hello-nice-number new-count)))
         ((> diff-count 0)
          (message "You have %s more messages since last refresh."
                   (notmuch-hello-nice-number diff-count)))
         ((< diff-count 0)
          (message "You have %s fewer messages since last refresh."
                   (notmuch-hello-nice-number (- diff-count)))))
        (setq notmuch-hello-refresh-count new-count))))

  (defun notmuch-mark-all-read()
    "Mark all as read in current search"
    q  (interactive)
    (notmuch-search-tag-all (list "-unread"))
    (notmuch-search-refresh-view))

  (defun notmuch-search-tag-and-advance (&rest tags)
    "Add tag or set of tags to current thread"
    (mapc 'notmuch-search-tag tags)
    (notmuch-search-next-thread))

  (defun notmuch-mark-as-read()
    "Mark current thread as read"
    (interactive)
    (notmuch-search-tag-and-advance (list "-unread")))

  (defun notmuch-mark-as-spam()
    "Mark the current message as spam"
    (interactive)
    (notmuch-search-tag-and-advance (list "+Spam" "-inbox" "-unread")))

  (defun notmuch-search-add-todo ()
    "Add 'TODO' tag when in search-mode"
    (interactive)
    (notmuch-search-tag-and-advance (list "+TODO")))

  (defun notmuch-search-remove-todo ()
    "Remove a 'TODO' tag in search mode"
    (interactive)
    (notmuch-search-tag-and-advance (list "-TODO")))

  (defun notmuch-mark-deleted ()
    "Add 'deleted' tag in search mode"
    (interactive)
    (notmuch-search-tag-and-advance (list "+deleted")))

  ;; Functions copied from
  ;; https://notmuchmail.org/pipermail/notmuch/2012/011692.html
  ;;(require 'bbdb-autoloads)
  ;;(require 'bbdb)
  (defun bbdb/notmuch-snarf-header (header)
    (let ((text (notmuch-show-get-header header)))
      (with-temp-buffer
        (insert text)
        (bbdb-snarf-region (point-min) (point-max)))))

  (defun bbdb/notmuch-snarf-from ()
    (interactive)
    (bbdb/notmuch-snarf-header :From))

  (defun bbdb/notmuch-snarf-to ()
    (interactive)
    (bbdb/notmuch-snarf-header :To))

  ;; color from line according to known / unknown sender
                                        ; code taken from bbdb-gnus.el
  (defun bbdb/notmuch-known-sender ()
    (let* ((from (plist-get headers :From))
           (splits (mail-extract-address-components from))
           (name (car splits))
           (net (cadr splits))
           (record (and splits
                        (bbdb-search-simple
                         name
                         (if (and net bbdb-canonicalize-net-hook)
                             (bbdb-canonicalize-address net)
                           net)))))
      (and record net (member (downcase net) (bbdb-record-net record)))))

  (defun bbdb/check-known-sender ()
    (interactive)
    (if (bbdb/notmuch-known-sender) (message "Sender is known") (message "Sender is not known")))

  (defface notmuch-show-known-addr
    '(
      (((class color) (background dark)) :foreground "spring green")
      (((class color) (background light)) :background "spring green" :foreground "black"))
    "Face for sender or recipient already listed in bbdb"
    :group 'notmuch-show
    :group 'notmuch-faces)

  (defface notmuch-show-unknown-addr
    '(
      (((class color) (background dark)) :foreground "dark orange")
      (((class color) (background light)) :background "gold" :foreground "black"))
    "Face for sender or recipient not listed in bbdb"
    :group 'notmuch-show
    :group 'notmuch-faces)

                                        ; override function from notmuch-show
  (defun notmuch-show-insert-headerline (headers date tags depth)
    "Insert a notmuch style headerline based on HEADERS for a
message at DEPTH in the current thread."
    (let ((start (point))
          (face (if (bbdb/notmuch-known-sender) 'notmuch-show-known-addr 'notmuch-show-unknown-addr))
          (end-from))
      (insert (notmuch-show-spaces-n (* notmuch-show-indent-messages-width depth))
              (notmuch-show-clean-address (plist-get headers :From)))
      (setq end-from (point))
      (insert
       " ("
       date
       ") ("
       (propertize (mapconcat 'identity tags " ")
                   'face 'notmuch-tag-face)
       ")\n")
      (overlay-put (make-overlay start (point)) 'face 'notmuch-message-summary-face)
      (save-excursion
        (goto-char start)
        (overlay-put (make-overlay start end-from) 'face face))))

  ;; Not much related configurations
  (defvar notmuch-hello-refresh-count 0)
  (setq mail-user-agent 'message-user-agent)

  (custom-set-variables
   '(notmuch-address-command "notmuch-addrlookup")
   '(notmuch-always-prompt-for-sender t)
   '(notmuch-crypto-process-mime t)
   '(notmuch-fcc-dirs
     (quote
      (("vasudev-debian@copyninja.info" . "vasudev-debian/Sent")
       ("vasudev@debian.org" . "vasudev-debian/Sent")
       ("vasudev@copyninja.info" . "vasudev/Sent")
       ("kamathvasudev@gmail.com" . "Gmail-1/Sent"))))
   '(notmuch-hello-tag-list-make-query "tag:unread")
   '(notmuch-message-headers (quote ("Subject" "To" "Cc" "Bcc" "Date" "Reply-To")))
   '(notmuch-saved-searches
     (quote
      ((:name "debian-devel" :query "folder:vasudev-debian/debian-devel and tag:unread")
       (:name "debian-fonts" :query "folder:vasudev-debian/debian-fonts and tag:unread")
       (:name "debian-india" :query "folder:vasudev-debian/debian-india and tag:unread")
       (:name "debian-devel-announce" :query "folder:vasudev-debian/debian-devel-announce and tag:unread")
       (:name "Plan9 and 9Front" :query "folder:vasudev/9fans and and folder:vasudev/9front and tag:unread")
       (:name "rkrishnan" :query "folder:vasudev/rkrishnan and tag:unread")
       (:name "rrs" :query "folder:vasudev/rrs and tag:unread")
       (:name "Gmail/INBOX" :query "folder:Gmail-1/INBOX and tag:unread")
       (:name "vasudev/INBOX" :query "folder:vasudev/INBOX and tag:unread")
       (:name "vasudev-debian/INBOX" :query "folder:vasudev-debian/INBOX and tag:unread")
       (:name "debian-project" :query "folder:vasudev-debian/debian-project and tag:unread")
       (:name "libindic-dev" :query "folder:vasudev/libindic-dev and tag:unread")
       (:name "TODO" :query "tag:TODO")
       (:name "debian-rust" :query "folder:vasudev-debian/pkg-rust and tag:unread")
       (:name "Tahoe Development" :query "folder:vasudev/tahoe-dev and tag:unread")
       (:name "debian-backports" :query "folder:vasudev-debian/debian-backports and tag:unread")
       (:name "pkg-libvirt" :query "folder:vasudev-debian/pkg-libvirt and tag:unread")
       (:name "Intrigeri conversations" :query "folder:vasudev/nm-process and tag:unread")
       (:name "Debian Multimedia (my packages)"
                :query "folder:vasudev-debian/pkg-multimedia and tag:unread and \( subject:(rem.*):.* or subject:(librem.*):.* \)")
       (:name "Debian VoIP (my packages)"
                :query "folder:vasudev-debian/pkg-voip and tag:unread and subject:(*libre*):.* or subject:(baresip*):.* or subject:(biboumi*):.*"))))
   '(notmuch-search-line-faces
     (quote
      (("deleted" :foreground "red")
       ("unread" :weight bold)
       ("flagged" :foreground "blue"))))
   '(notmuch-search-oldest-first nil)
   '(notmuch-show-all-multipart/alternative-parts nil)
   '(notmuch-show-all-tags-list t)
   '(notmuch-show-insert-text/plain-hook
     (quote
      (notmuch-wash-convert-inline-patch-to-part notmuch-wash-tidy-citations
                                                 notmuch-wash-elide-blank-lines
                                                 notmuch-wash-excerpt-citations))))
  (add-hook 'notmuch-hello-refresh-hook 'notmuch-hello-refresh-status-message nil t)
  (define-key notmuch-search-mode-map "u" 'notmuch-mark-as-read)
  (define-key notmuch-search-mode-map "U" 'notmuch-mark-all-read)

  (define-key notmuch-search-mode-map (kbd "S-<f9>") 'notmuch-search-remove-todo)
  (define-key notmuch-search-mode-map (kbd "<f9>") 'notmuch-search-add-todo)

  (define-key notmuch-search-mode-map "d" 'notmuch-mark-deleted)
  (define-key notmuch-search-mode-map "s" 'notmuch-mark-as-spam)

  (define-key notmuch-show-mode-map "c" 'bbdb/notmuch-snarf-from)
  (define-key notmuch-show-mode-map "C" 'bbdb/notmuch-snarf-to)

  ;; Bounce key for bouncing message
  (define-key notmuch-show-mode-map "b"
    (lambda (&optional address)
      "Bounce the current message."
      (interactive "sBounce To: ")
      (notmuch-show-view-raw-message)
      (message-resend address)))

  (define-key notmuch-show-mode-map "d"
    (lambda ()
      "toggle deleted tag for message"
      (interactive)
      (if (member "deleted" (notmuch-show-get-tags))
          (notmuch-show-tag (list "-deleted"))
        (notmuch-show-tag (list "+deleted")))))
  )
