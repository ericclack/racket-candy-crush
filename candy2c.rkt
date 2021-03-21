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

(define (cursor+scene cursor scene)
  (place-image/align (bitmap "images/selected.png")
                     (* BSIZE (posn-x cursor))
                     (* BSIZE (posn-y cursor))
                     "left" "top"
                     scene))

(define (draw-world w)
  (cursor+scene (world-cursor w)
                (candy+scene (world-candy w) 
                             (empty-scene (* WIDTH BSIZE)
                                          (* HEIGHT BSIZE) "black"))))

(define (random-tile n) (random 1 9))

(define (move-posn a-posn x y)
  (make-posn (+ x (posn-x a-posn))
             (+ y (posn-y a-posn))))

(define (move-cursor w a-key)
  (world (world-candy w)
         (cond
           [(key=? a-key "left")  (move-posn (world-cursor w) -1 0)]
           [(key=? a-key "right") (move-posn (world-cursor w) 1 0)]
           [(key=? a-key "up")    (move-posn (world-cursor w) 0 -1)]
           [(key=? a-key "down")  (move-posn (world-cursor w) 0 1)]
           [else (world-cursor w)])))

(big-bang
    (world (build-list (* WIDTH HEIGHT) random-tile)
           (make-posn 0 0))
  (to-draw draw-world)
  (on-key move-cursor))