#lang racket
(require 2htdp/universe)
(require 2htdp/image)

(define WIDTH 8)
(define HEIGHT 10)
(define BLOCK-SIZE 40)

(define (draw-world w)
  (empty-scene (* WIDTH BLOCK-SIZE)
               (* HEIGHT BLOCK-SIZE) "black"))

(big-bang null
  (to-draw draw-world))