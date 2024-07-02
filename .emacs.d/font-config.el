;; -*- coding: utf-8; lexical-binding: t; -*-
;; beelleau font-config.el

;; there are 3 basic faces
;; 'default' : the default face, every face will fallback to default
;;             unless overriden
;; 'fixed-pitch' : face for monospace
;; 'variable-pitch' : face for italics


;; sticking with sf mono - but adjusting the sizing
(set-face-attribute 'default nil
                    :height 120)

(set-face-attribute 'mode-line nil
                    :height 110)
