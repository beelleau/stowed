;; -*- coding: utf-8; lexical-binding: t; -*-
;; beelleau keybinds.el

;;; OS SPECIFIC
;; mac option as 'meta'
;; mac command will be 'super' and have most normal macos shortcuts
;; 'alt' is unchanged
(setq-default mac-option-modifier 'meta)

;;; DEFINE PREFIXES
;; notif
(define-prefix-command 'notif-prefix-map)
;; substitute
(define-prefix-command 'substitute-prefix-map)
;; flymake
(define-prefix-command 'flymake-prefix-map)
;; frame resize functions
(define-prefix-command 'bell-resize-prefix-map)
;; mode toggles
(define-prefix-command 'toggle-prefix-map)

;;; MAJOR MODE KEY HOOKS
;; ruby hook
(add-hook 'ruby-mode-hook
          (lambda ()
            (define-prefix-command 'bell-ruby-map)
            (local-set-key (kbd "C-c r") bell-ruby-map)
            (local-set-key (kbd "C-c r c") #'inf-ruby-console-auto)
            (local-set-key (kbd "C-c r a") #'ruby-auto)))

;; markdown hook
(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key (kbd "C-<return>") #'bell-markdown-newline)))

;;; MINOR MODE MAPS
(let ((map paredit-mode-map))
  (define-key paredit-mode-map (kbd "M-D") #'paredit-forward-kill-word)
  (define-key paredit-mode-map (kbd "M-d") nil))

;;; GLOBAL MAP
(let ((map global-map))

  (define-key map (kbd "<escape>") 'keyboard-escape-quit)

  ;; bell functions
  (define-key map (kbd "M-d") #'bell-delete-word)
  (define-key map (kbd "M-<backspace>") #'bell-backward-delete-word)
  (define-key map (kbd "C-x o") #'bell-write-file-out)
  (define-key map (kbd "C-w") #'bell-show-file-path)
  (define-key map (kbd "C-x C-s") #'bell-find-file-ssh)
  (define-key map (kbd "s-<backspace>") #'bell-backward-delete-line)

  ;; undo-fu
  (define-key map (kbd "M-u") #'undo-fu-only-undo)
  (define-key map (kbd "M-z") #'undo-fu-only-redo)
  (define-key map (kbd "M-Z") #'undo-fu-only-redo-all)
  (define-key map (kbd "M-U") #'undo-fu-disable-checkpoint)

  ;; frame, window, buffer navigation
  (define-key map (kbd "s-p") #'other-window)
  (define-key map (kbd "s-]") #'next-buffer)
  (define-key map (kbd "s-[") #'previous-buffer)
  (define-key map (kbd "M-n") #'forward-paragraph)
  (define-key map (kbd "M-p") #'backward-paragraph)
  (define-key map (kbd "C-v") #'scroll-down-command)
  (define-key map (kbd "M-v") #'scroll-up-command)

  ;; common in-buffer shortcuts
  (define-key map (kbd "C-c d") #'delete-trailing-whitespace)
  (define-key map (kbd "M-_") #'goto-line)
  (define-key map (kbd "M-l") #'count-lines-page)
  (define-key map (kbd "C-x u") #'upcase-word)
  (define-key map (kbd "C-x l") #'downcase-word)

  ;; notif functions (prefixed)
  (define-key map (kbd "C-c n") notif-prefix-map)
  (define-key map (kbd "C-c n f") #'notif-find-note)
  (define-key map (kbd "C-c n r") #'notif-find-note-read-only)
  (define-key map (kbd "C-c n i") #'notif-find-ticket)
  (define-key map (kbd "C-c n t") #'notif-find-todo)
  (define-key map (kbd "C-c n n") #'notif-find-notepad)
  ;; (define-key map (kbd "C-c n f") #'notif-search)

  ;; substitute functions (prefixed)
  (define-key map (kbd "C-c q") substitute-prefix-map)
  (define-key map (kbd "C-c q q") #'substitute-target-in-buffer)
  (define-key map (kbd "C-c q f") #'substitute-target-in-defun)
  (define-key map (kbd "C-c q e") #'substitute-target-below-point)
  (define-key map (kbd "C-c q a") #'substitute-target-above-point)

  ;; flymake functions (prefixed)
  (define-key map (kbd "C-c k") flymake-prefix-map)
  (define-key map (kbd "C-c k k") #'flymake-mode)
  (define-key map (kbd "C-c k n") #'flymake-goto-next-error)
  (define-key map (kbd "C-c k p") #'flymake-goto-prev-error)
  (define-key map (kbd "C-c k d") #'flymake-show-diagnostic)
  (define-key map (kbd "C-c k b") #'flymake-running-backends)
  (define-key map (kbd "C-c k m") #'flymake-menu)

  ;; resize frame functions (prefixed)
  (define-key map (kbd "C-c f") bell-resize-prefix-map)
  (define-key map (kbd "C-c f f") #'bell-resize-frame-default)
  (define-key map (kbd "C-c f d") #'bell-resize-frame-double)
  (define-key map (kbd "C-c f w") #'bell-resize-frame-wide)
  (define-key map (kbd "C-c f t") #'bell-resize-frame-thin)

  ;; buffer toggles for minor modes + (prefixed)
  (define-key map (kbd "C-c t") toggle-prefix-map)
  (define-key map (kbd "C-c t w") #'whitespace-mode)
  (define-key map (kbd "C-c t e") #'display-fill-column-indicator-mode)
  (define-key map (kbd "C-c t l") #'display-line-numbers-mode)
  (define-key map (kbd "C-c t i") #'indent-bars-mode)
  (define-key map (kbd "C-c t t") #'modus-themes-toggle)
  (define-key map (kbd "C-c t s") #'speedbar-frame-mode)

  ;; org-mode globals
  (define-key map (kbd "C-c l") #'org-store-link)

  ;; recentf
  (define-key map (kbd "C-c o") #'recentf-open-files)

  ;; packages
  (define-key map (kbd "C-c p") #'list-packages)

  ;; scratch buffer
  (define-key map (kbd "C-c s") #'scratch-buffer)

  ;; unset overlapping macos keybindings (make these available for use)
  (define-key map (kbd "C-s") nil)      ; emacs isearch-forward
  (define-key map (kbd "M-w") nil)      ; emacs copy
  (define-key map (kbd "C-y") nil)      ; emacs paste
  (define-key map (kbd "C-x C-w") nil)  ; emacs write-out
  (define-key map (kbd "C-x C-c") nil)  ; emacs quit emacs

  ;; unset keybdings
  (define-key map (kbd "C-x z") nil)
  (define-key map (kbd "C-\\") nil)
  (define-key map (kbd "C-x <right>") nil)
  (define-key map (kbd "C-x <left>") nil)
  (define-key map (kbd "C-x <down>") nil)
  (define-key map (kbd "C-x <up>") nil)

  ;; ignore keys
  (define-key map (kbd "C-<right>") 'ignore)
  (define-key map (kbd "C-<left>") 'ignore)
  (define-key map (kbd "C-<up>") 'ignore)
  (define-key map (kbd "C-<down>") 'ignore)
  (define-key map (kbd "M-<right>") 'ignore)
  (define-key map (kbd "M-<left>") 'ignore)
  (define-key map (kbd "M-<up>") 'ignore)
  (define-key map (kbd "M-<down>") 'ignore)
  (define-key map (kbd "C-x C-<right>") 'ignore)
  (define-key map (kbd "C-x C-<left>") 'ignore)
  (define-key map (kbd "C-x C-<up>") 'ignore)
  (define-key map (kbd "C-x C-<down>") 'ignore))
