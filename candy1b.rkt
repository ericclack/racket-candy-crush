#lang racket
(require 2htdp/universe)
(require 2htdp/image)
(require lang/posn)

(define WIDTH 8)
(define HEIGHT 10)
(define BSIZE 40)

(struct world (candy cursor))

(define (candy->bitmap number)
  (bitmap/file (string-append "images/" (number->string number) ".png")))

(define (number->posn number)
  (make-posn (* number BSIZE) 0))

(define (candy+scene candy scene)
  (place-image/align (bitmap/file "images/1.png")
                     0 0
                     "left" "top"
                     scene))

(define (draw-world w)
  (candy+scene (world-candy w)
               (empty-scene (* WIDTH BSIZE)
                            (* HEIGHT BSIZE) "blue")))

(big-bang (world (list 1 2 3 4 5 6 7 8) null)
  (to-draw draw-world))