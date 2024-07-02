;; -*- coding: utf-8; lexical-binding: t; -*-
;; beelleau major-modes-config.el

;; org
(defun org-config ()
  (setq org-startup-folded t
        org-hide-emphasis-markers t
        tab-width 2)
  (visual-line-mode 1)
  (org-indent-mode 1)
  (org-superstar-mode 1)
  (flyspell-mode 1))
(add-hook 'org-mode-hook #'org-config)

;; emacs lisp
(defun elisp-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t
        fill-column 80
        indent-tabs-mode nil
        tab-width 2)
  (display-fill-column-indicator-mode 1)
  (corfu-mode 1)
  (paredit-mode 1))
(add-hook 'emacs-lisp-mode-hook #'elisp-config)

;; sh
(defun sh-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t
        fill-column 80
        indent-tabs-mode nil
        tab-width 2
        sh-basic-offset 2)
  (display-fill-column-indicator-mode 1)
  (flymake-mode 1)
  (corfu-mode 1)
  (indent-bars-mode 1))
(add-hook 'sh-mode-hook #'sh-config)

;; sed
(defun sed-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t
        fill-column 80
        indent-tabs-mode nil
        tab-width 2)
  (display-fill-column-indicator-mode 1))
(add-hook 'sed-mode-hook #'sed-config)

;; ruby
(defun ruby-config ()
  (ruby-auto)
  (visual-line-mode -1)
  (inf-ruby-minor-mode 1)
  (setq truncate-lines t
        show-trailing-whitespace t
        fill-column 80
        indent-tabs-mode nil
        tab-width 2
        ruby-indent-tabs-mode nil
        ruby-indent-level 2)
  (display-fill-column-indicator-mode 1)
  (eglot-ensure)
  (corfu-mode 1)
  (indent-bars-mode 1))
(add-hook 'ruby-mode-hook #'ruby-config)

;; yaml
(defun yaml-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t
        fill-column 80
        indent-tabs-mode nil
        tab-width 2)
  (display-fill-column-indicator-mode 1)
  (corfu-mode 1)
  (indent-bars-mode 1))
(add-hook 'yaml-mode-hook #'yaml-config)

;; dockerfile
(defun dockerfile-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t)
  (corfu-mode 1))
(add-hook 'dockerfile-mode-hook #'dockerfile-config)

;; markdown
(defun md-config ()
  (visual-line-mode 1)
  (flyspell-mode 1))
(add-hook 'markdown-mode-hook #'md-config)

;; snippet
(defun snippet-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t))
(add-hook 'snippet-mode-hook #'snippet-config)
