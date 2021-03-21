#lang racket
(require 2htdp/universe)
(require 2htdp/image)

(define WIDTH 8)
(define HEIGHT 10)
(define BSIZE 40)

(define (candy->bitmap number)
  (bitmap/file (format "images/~a.png" number)))

(define (draw-world w)
  (empty-scene (* WIDTH BSIZE)
               (* HEIGHT BSIZE) "black"))

(big-bang null
  (to-draw draw-world))