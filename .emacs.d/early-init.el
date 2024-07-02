;; -*- coding: utf-8; lexical-binding: t; -*-
;; beelleau early-init.el

;; set garbage collection to 20 MB
(setq gc-cons-threshold (* 20 1048576))

;; utf-8 default encoding
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; disable some ui elements here for faster loading
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(scroll-bar-lines . 0) default-frame-alist)

;; set default frame size
(push '(width . 81) default-frame-alist)
(push '(height . 61) default-frame-alist)

;; give basic frame coloring while waiting for theme to load
;; set color to match theme that is being loaded for smoothness
(set-face-attribute 'default nil :background "#000000")

;; set frame title temporarily
(setq frame-title-format (concat "Starting GNU Emacs " emacs-version "..."))
