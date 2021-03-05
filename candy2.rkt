#lang racket
(require 2htdp/universe)
(require 2htdp/image)
(require lang/posn)
(require racket/format)

(define WIDTH 8)
(define HEIGHT 12)
(define BLOCK-SIZE 40)

(struct world (candy cursor) #:transparent)

(define (candy->img i)
  (if (null? i)
      empty-image
      (bitmap/file (string-append "images/" (number->string i) ".png"))))

(define (index->posn i)
  (let ([x (remainder i WIDTH)]
        [y (quotient i WIDTH)])
    (make-posn (+ 20 (* 40 x))
               (+ 20 (* 40 y)))))

(define (candy-posns candy)
  (map index->posn
       (range (length candy))))

(define (candy+scene candy scene)
  (place-images (map candy->img candy)
                (candy-posns candy)
                scene))

(define (render-world w)
  (candy+scene (world-candy w) 
               (empty-scene (* WIDTH BLOCK-SIZE)
                            (* HEIGHT BLOCK-SIZE) "black")))

(big-bang (world (build-list (* WIDTH HEIGHT)
                             (lambda (x) (random 1 8)))
                 null)            
            (to-draw render-world))