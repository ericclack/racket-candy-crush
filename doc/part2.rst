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

Do you remember what `number->posn` does? It simply multiplies the
candy number by 40 and adds on a bit so that the tile is on the
screen. This creates a single line of candy that pretty quickly
runs of the screen. However, we really want a grid of candy.

So currently we have this:

1 2 3 4 5 6 7 8 9 ...

But we want something like this:

1 2 3 4

5 6 7 8

9 ...

So we need our function to `go to the next line` when it runs
out of space.





Adding the cursor
-----------------
