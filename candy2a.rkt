#lang racket
(require 2htdp/universe)
(require 2htdp/image)
(require lang/posn)
(require racket/format)

(define WIDTH 8)
(define HEIGHT 12)
(define BSIZE 40)

(struct world (candy cursor))

(define (candy->bitmap number)
  (if (null? number)
      empty-image
      (bitmap/file (format "images/~a.png" number))))

(define (number->posn i)
  (define x (remainder i WIDTH))
  (define y (quotient i WIDTH))
  (make-posn (* BSIZE x) (* BSIZE y)))

(define (candy+scene candy scene)
  (place-images/align (map candy->bitmap candy)
                      (map number->posn (range (length candy)))
                      "left" "top"
                      scene))

(define (draw-world w)
  (candy+scene (world-candy w) 
               (empty-scene (* WIDTH BSIZE)
                            (* HEIGHT BSIZE) "black")))

(define (random-tile n) (random 1 9))

(big-bang
    (world (build-list (* WIDTH HEIGHT) random-tile)
           null)
  (to-draw draw-world))