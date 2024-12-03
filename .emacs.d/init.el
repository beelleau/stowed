;; -*- coding: utf-8; lexical-binding: t; -*-
;; beelleau init.el
(require 'package)

;; FILE ENCODING
(set-language-environment "utf-8")
(set-default-coding-systems 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

;;; THEME
(require 'modus-themes)
(setq modus-themes-org-blocks 'gray-background
      modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      modus-themes-region '(bg-only no-extend)
      modus-themes-headings
      '((1 . (background overline variable-pitch 1.07))
        (2 . (variable-pitch 1.03))
        (3 . (variable-pitch 1.01))))
(load-theme 'modus-vivendi-tinted :no-confirm)

;;; FONTS
(load-file (concat user-emacs-directory "font-config.el"))

;;; UI
(set-fringe-mode 10)
(line-number-mode 1)
(scroll-bar-mode -1)
(pixel-scroll-precision-mode 1)
(save-place-mode 1)
(defalias 'yes-or-no-p #'y-or-n-p)
(setq-default cursor-type 'bar)
(setq column-number-mode t
      window-min-height 2
      window-min-width 10
      window-resize-pixelwise t
      frame-resize-pixelwise t
      use-dialog-box nil
      confirm-kill-emacs #'y-or-n-p
      tab-always-indent 'complete
      frame-title-format '("GNU Emacs " emacs-version)
      ;; make scratch buffer blank
      initial-scratch-message nil
      ;; change scratch buffer major mode to special
      initial-major-mode 'literate-scratch-mode
      read-extended-command-predicate #'command-completion-default-include-p)

;;; FILE MANAGEMENT
;; backups
(make-directory (concat user-emacs-directory "backups") t)
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 7
      version-control t)

;; clean up file clutter, sessions and autosaves
;; create 'sessions' and 'auto-saves' directory
(make-directory (concat user-emacs-directory "tmp/sessions") t)
(make-directory (concat user-emacs-directory "tmp/auto-saves") t)
;; save tmp files; redirecting 'auto-saves' to a new location
(setq auto-save-list-file-prefix
      (concat user-emacs-directory "tmp/sessions/")
      auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "tmp/auto-saves/") t)))

;;; SEARCH, SUBSTITUTE.EL CONFIGURATIONS
;; turn on search counter and format it
(setq isearch-lazy-count t
      lazy-count-prefix-format "(%s/%s) "
      lazy-count-suffix-format nil
      ;; make regular isearch interpret empty space as a regular expression
      search-whitespace-regex ".*?")

;; MANUALLY INSTALLED PACKAGES
(add-to-list 'load-path
             (concat user-emacs-directory "lisp/"))

;; load notif
(require 'notif)

;; load ruby-auto
(require 'ruby-auto)

;;; MINOR MODE CONFIGURATIONS
;; tramp
(require 'tramp)
;; adding a gem location to tramp's default remote path
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(add-to-list 'tramp-remote-path "/usr/local/bundle/bin")

;; vertico
(require 'vertico)
(vertico-mode t)
(setq read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t
      completion-ignore-case t
      vertico-cycle t)
;; enabled savehist mode (used with vertico)
(savehist-mode t)

;; completion styles (orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides
      '((file (styles basic partial-completion))))

;; recentf
(setq recentf-max-menu-items 10
      recentf-max-saved-items 10
      recentf-max-size 10)
(recentf-mode 1)
;; recentf exclusions
(add-to-list 'recentf-exclude "TODO")
(add-to-list 'recentf-exclude "Notepad")

;; indent-bars mode customizations
(setq indent-bars-prefer-character "│"
      indent-bars-starting-column 0
      indent-bars-color '(highlight :face-bg nil :blend 0.3)
      indent-bars-pattern "."
      indent-bars-width-frac 0.2
      indent-bars-pad-frac 0.1
      indent-bars-zigzag nil
      indent-bars-color-by-depth nil
      indent-bars-highlight-current-depth nil
      indent-bars-display-on-blank-lines nil)

;; electric pair mode
(electric-pair-mode 1)
; Remove angle brackets from the list
(setq electric-pair-alist '(quote (?< \))))

;; speedbar
(setq speedbar-default-position 'left
      speedbar-show-unknown-files t
      speedbar-use-images nil)

;; project
(require 'project)
(setq project-root-buffer-face '(:background "lightblue")
      project-vc-ignore-regexs '("\\.git$" "\\.log$"))

;; yasnippet
(setq yas-snippet-dirs '("~/snippets"))
(require 'yasnippet)
(yas-global-mode 1)

;; flymake mode
(require 'flymake)
(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

;; eglot
(require 'eglot)
(setq eglot-autoshutdown t)
;; use ruby-lsp instead of solargraph for ruby
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((ruby-mode ruby-ts-mode)
                                        "ruby-lsp")))

;; corfu
(require 'corfu)
(setq corfu-auto t
      corfu-quit-no-match 'separator
      corfu-separator ?_
      corfu-auto-delay 0.3
      corfu-auto-prefix 1)

;; lin
(setq lin-mode-hooks
      '(emacs-lisp-mode-hook
        sh-mode-hook
        sed-mode-hook
        ruby-mode-hook
        yaml-mode-hook
        markdown-mode-hook
        dockerfile-mode-hook
        ediff-hook
        Buffer-menu-mode-hook
        recentf-dialog-mode-hook))
(lin-global-mode 1)

;; org babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (ruby . t)))

;; spellcheck
(setq-default ispell-program-name "/opt/homebrew/bin/aspell")

;;; MAJOR MODE CONFIGURATIONS
(load-file (concat user-emacs-directory "major-modes-config.el"))
;; hooks are found in the major-modes-config.el file

;;; BELL FUNCTIONS
(load-file (concat user-emacs-directory "bell-functions.el"))

;;; KEYBINDINGS
(load-file (concat user-emacs-directory "keybindings.el"))

;;; DEFAULT BROWSER
(setq browse-url-browser-function #'browse-url-default-macosx-browser)

;;; AFTER INIT
(add-hook 'after-init-hook
          (lambda ()
            (with-current-buffer "*Messages*"
              (text-scale-decrease 1))))

;;; SELECTED PACKAGES
(load-file (concat user-emacs-directory "selected-packages-config.el"))
