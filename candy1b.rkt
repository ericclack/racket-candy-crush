#lang racket
(require 2htdp/universe)
(require 2htdp/image)

(define WIDTH 8)
(define HEIGHT 10)
(define BLOCK-SIZE 40)

(struct world (candy cursor))
(struct posn (x y))

(define (candy->bitmap number)
  (bitmap/file (string-append "images/" (number->string number) ".png")))

(define (number->posn number)
  (posn (* number 40) 0))

(define (candy+scene candy scene)
  (place-image (bitmap/file "images/1.png")
               (/ BLOCK-SIZE 2) (/ BLOCK-SIZE 2) 
               scene))

(define (draw-world w)
  (candy+scene (world-candy w)
               (empty-scene (* WIDTH BLOCK-SIZE)
                            (* HEIGHT BLOCK-SIZE) "blue")))

(big-bang (world (list 1 2 3) null)
  (to-draw draw-world))