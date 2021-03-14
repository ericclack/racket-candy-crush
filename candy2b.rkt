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

(define (pixels i)
  (+ (/ BSIZE 2) (* BSIZE i)))

(define (index->posn i)
  (define x (remainder i WIDTH))
  (define y (quotient i WIDTH))
  (make-posn (pixels x) (pixels y)))

(define (candy-posns candy)
  (map index->posn
       (range (length candy))))

(define (candy+scene candy scene)
  (place-images (map candy->img candy)
                (candy-posns candy)
                scene))

(define (cursor+scene cursor scene)
  (place-image (bitmap "images/selected.png")
               (pixels (posn-x cursor))
               (pixels (posn-y cursor))
               scene))

(define (draw-world w)
  (cursor+scene (world-cursor w)
                (candy+scene (world-candy w) 
                             (empty-scene (* WIDTH BSIZE)
                                          (* HEIGHT BSIZE) "black"))))

(define (random-tile n) (random 1 9))

(big-bang
    (world (build-list (* WIDTH HEIGHT) random-tile)
           (make-posn 0 0))
  (to-draw draw-world))