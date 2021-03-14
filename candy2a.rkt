#lang racket
(require 2htdp/universe)
(require 2htdp/image)
(require lang/posn)
(require racket/format)

(define WIDTH 8)
(define HEIGHT 12)
(define BSIZE 40)

(struct world (candy cursor))

(define (candy->img i)
  (if (null? i)
      empty-image
      (bitmap/file (string-append "images/" (number->string i) ".png"))))

(define (index->posn i)
  (define x (remainder i WIDTH))
  (define y (quotient i WIDTH))
  (make-posn (+ (/ BSIZE 2) (* BSIZE x))
             (+ (/ BSIZE 2) (* BSIZE y))))

(define (candy-posns candy)
  (map index->posn
       (range (length candy))))

(define (candy+scene candy scene)
  (place-images (map candy->img candy)
                (candy-posns candy)
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