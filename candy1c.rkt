#lang racket
(require 2htdp/universe)
(require 2htdp/image)
(require lang/posn)
(require racket/format)

(define WIDTH 10)
(define HEIGHT 15)
(define BLOCK-SIZE 40)

(struct world (candy cursor) #:transparent)

(define (candy->bitmap i)
  (if (null? i)
      empty-image
      (bitmap/file (string-append "images/" (number->string i) ".png"))))

(define (number->posn i)
  (make-posn (+ 20 (* 40 i)) 20))

(define (candy+scene candy scene)
  (place-images (map candy->bitmap candy)
                (map number->posn (range (length candy)))
                scene))

(define (draw-world w)
  (candy+scene (world-candy w) 
               (empty-scene (* WIDTH BLOCK-SIZE)
                            (* HEIGHT BLOCK-SIZE) "black")))

(big-bang (world (list 1 2 3 null 5 1 2 3 4 5 6 7) null)            
            (to-draw draw-world))