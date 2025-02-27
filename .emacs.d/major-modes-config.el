;; -*- coding: utf-8; lexical-binding: t; -*-
;; beelleau major-modes-config.el

;; default basic in-buffer configurations:
;; tabs => spaces
;; tab size => 2 (spaces)
;; fill column => 80

(defun org-config ()
  (visual-line-mode 1)
  (setq org-startup-folded t
        org-hide-emphasis-markers t)
  (org-indent-mode 1)
  (org-superstar-mode 1)
  (flyspell-mode 1))
(add-hook 'org-mode-hook #'org-config)

(defun elisp-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t)
  (display-fill-column-indicator-mode 1)
  (corfu-mode 1)
  (paredit-mode 1))
(add-hook 'emacs-lisp-mode-hook #'elisp-config)

(defun sh-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t
        sh-basic-offset 2)
  (display-fill-column-indicator-mode 1)
  (flymake-mode 1)
  (corfu-mode 1)
  (indent-bars-mode 1))
(add-hook 'sh-mode-hook #'sh-config)

(defun sed-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t)
  (display-fill-column-indicator-mode 1))
(add-hook 'sed-mode-hook #'sed-config)

(defun py-config ()
  (visual-line-mode -1)
  (pyvenv-mode 1)
  (setq truncate-lines t
        show-trailing-whitespace t
        python-indent-guess-indent-offset-verbose nil
        tab-width 4)
  (display-fill-column-indicator-mode 1)
  (eglot-ensure)
  (corfu-mode 1)
  (indent-bars-mode 1))
(add-hook 'python-mode-hook #'py-config)

(defun yaml-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t
        yaml-indent-offset 2)
  (display-fill-column-indicator-mode 1)
  (flymake-mode 1)
  (corfu-mode 1)
  (indent-bars-mode 1))
(add-hook 'yaml-mode-hook #'yaml-config)

(defun json-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t)
  (corfu-mode 1)
  (indent-bars-mode 1))
(add-hook 'json-mode-hook #'json-config)

(defun dockerfile-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t)
  (corfu-mode 1))
(add-hook 'dockerfile-mode-hook #'dockerfile-config)

(defun md-config ()
  (visual-line-mode 1)
  (flyspell-mode 1))
(add-hook 'markdown-mode-hook #'md-config)

(defun snippet-config ()
  (visual-line-mode -1)
  (setq truncate-lines t
        show-trailing-whitespace t))
(add-hook 'snippet-mode-hook #'snippet-config)
