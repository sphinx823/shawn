;; to open eww bookmark list instead of open eww first
;;(global-set-key "\C-c\C-b" 'eww-list-bookmarks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set org-agenda-files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-agenda-files (list "~/todolist/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set the org todo keywords
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-todo-keywords
      '(
	(sequence "REPORT(r!)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
	(sequence "TODO(T!)" "PENDING(P@/!)" "DOING(d!)" "|" "DONE(D@/!)" "CANCELED(C@/!)")
	)
      )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-agenda related key bind
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswithhb)

;; load emacs tasks
;;(find-file "~/todolist/ICN.org")
;;(show-subtree)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; insert date and time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar current-date-time-format "<%Y-%m-%d %a %H:%M>"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%H:%M"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert (format-time-string current-date-time-format (current-time)))
        )

(defun insert-current-time ()
  "insert the current time into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       )

(global-set-key "\C-cdt" 'insert-current-date-time)
(global-set-key "\C-ctm" 'insert-current-time)
(put 'downcase-region 'disabled nil)

;;show the line number and column number in the minibuffer
(setq column-number-mode t)
(setq line-number-mode t)

;;open eww bookmarks on start
(require 'eww)
;;(eww-list-bookmarks)
;;(delete-other-windows)
;;(eww-bookmark-browse)
(global-set-key "\C-c\C-b" 'eww-list-bookmarks)

;;change the title of Emacs
(setq frame-title-format "Welcome to Emacs world!")

;; disable menu bar
(menu-bar-mode nil)

;; disable tool bar
(tool-bar-mode nil)

;; disable scroll bar
;(set-scroll-bar-mode nil)

;; turn off the startup message
(setq inhibit-startup-message t)

;; turn off gnus startup mesage
(setq gnus-inhibit-startup-message t)

;; turn off beep
(setq visibale-bel t)

;; set default path for dired
(setq default-directory "~/")

;; avoid jump on next page
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)

;; when cursor go to next line, keep it on the end of the line
(setq track-eol t)

;; show time on the minibuffer
(setq display-time-day-and-date t)
(display-time-mode t)

(setq display-time-24hr-format t)

;; define key bindings
(global-set-key "\C-ce" 'eval-buffer)

;; import melpa
(when (>= emacs-major-version 24)
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)

;; set emacs theme
(load-theme 'deeper-blue t)


;;set eww as the default browser
(setq browse-url-browser-function 'eww-browse-url)


;;enable auto line wrap
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) 
