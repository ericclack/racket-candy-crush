#lang racket
(require 2htdp/universe)
(require 2htdp/image)

(define WIDTH 10)
(define HEIGHT 15)
(define BLOCK-SIZE 40)

(define (render-world w)
  (empty-scene (* WIDTH BLOCK-SIZE)
               (* HEIGHT BLOCK-SIZE) "black"))

(big-bang null
  (to-draw render-world))