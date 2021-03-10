.. _part2:

Part 2
======

All the code
------------

Here's what you program should look like by the end of part 1:

.. code:: racket

   #lang racket
   (require 2htdp/universe)
   (require 2htdp/image)
   (require lang/posn)

   (define WIDTH 10)
   (define HEIGHT 15)
   (define BSIZE 40)

   (struct world (candy cursor))

   (define (candy->bitmap number)
     (bitmap/file (string-append "images/" (number->string number) ".png")))

   (define (number->posn number)
     (make-posn (+ (/ BSIZE 2)
		   (* BSIZE number))
		(/ BSIZE 2)))

   (define (candy+scene candy scene)
     (place-images (map candy->bitmap candy)
		   (map number->posn (range (length candy)))
		   scene))

   (define (draw-world w)
     (candy+scene (world-candy w) 
		  (empty-scene (* WIDTH BSIZE)
			       (* HEIGHT BSIZE) "black")))

   (big-bang (world (list 1 2 3 4 5 6 7 8) null)            
	       (to-draw draw-world))	  

A grid of candy
---------------


Adding the cursor
-----------------
