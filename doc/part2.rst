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
     (make-posn (* BSIZE number) 0))

   (define (candy+scene candy scene)
     (place-images/align (map candy->bitmap candy)
			 (map number->posn (range (length candy)))
			 "left" "top"
			 scene))

   (define (draw-world w)
     (candy+scene (world-candy w) 
		  (empty-scene (* WIDTH BSIZE)
			       (* HEIGHT BSIZE) "black")))

   (big-bang (world (list 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8) null)            
	       (to-draw draw-world))  

A grid of candy
---------------

Do you remember what `number->posn` does? It simply multiplies the
candy number by 40 and adds on a bit so that the tile is on the
screen. This creates a single line of candy that pretty quickly
runs off the screen. However, we really want a grid of candy.

So currently we have this::

  1 2 3 4 5 6 7 8 9 ...

You can see this by trying this code in the REPL:

.. code:: racket

   (number->posn 1)
   (number->posn 8)
   (number->posn 15)
   (number->posn 20)

They all return something followed by `20` which means they are all on
the same line, since `20` is the y-position. 

But we want something like this::

  1 2 3 4

  5 6 7 8

  9 ...

So we need our function to `go to the next line` when it runs out of
space. In fact we know from our `WIDTH` constant that we have space
for 10 tiles.

We can do this with two maths concepts: quotient and remainder:

* Quotient is the whole number we get when dividing two numbers -- So
  the quotient of 15 / 10 is 1 because 15 can be divided by 10 once.
* Remainder is what we're left with after dividing by a number -- So
  the remainder of 15 / 10 is 5.

The remainder is the x position in the grid and the quotient is the y
position.

OK, so let's use this in our `number->posn` function:

.. code-block:: racket
   :emphasize-lines: 2-5

   (define (index->posn i)
     (define x (remainder i WIDTH))
     (define y (quotient i WIDTH))
     (make-posn (+ (/ BSIZE 2) (* BSIZE x))
		(+ (/ BSIZE 2) (* BSIZE y))))

Now run your code and see the results. You will need to ensure you
have enough tiles in your world, at least 11 of them, you can add them
in the `big-bang` function, like this:

.. code-block:: racket
   :emphasize-lines: 1

   (big-bang (world (list 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8) null)            
            (to-draw draw-world))


Lots more candy
...............

Typing all the candy in by hand in that list is not great, and also
means every game will be the same. How can we generate more candy
and make it different every time?

First meet the function `random`, try these in the REPL:

.. code:: racket

   (random)

   (random 1 100)

   (random 1 9)

Next meet function `build-list`, this will call a function a set
number of times and make a list from the results. So we can
define a new function to generate a random tile, try this in the
REPL:

.. code:: racket

   (define (random-tile n) (random 1 8))

Notice that this function takes a single argument `n` which it never
uses. That's because `build-list` will pass in a number each time
it calls it and we need to ensure that these functions fit nicely
together.

Here's it working in the REPL:

.. code:: racket

   (build-list 50 random-tile)

So now we can use this to generate a game world full of tiles:

.. code-block:: racket
   :emphasize-lines: 1,3,4
		     
   (define (random-tile n) (random 1 9))

   (big-bang
      (world (build-list (* WIDTH HEIGHT) random-tile)
             null)            
     (to-draw draw-world))

Run your code a few times to confirm that the world is different
each time. 

Adding the cursor
-----------------

Fisrt let's set the position of the cursor to the top left of the
screen at the start. You might remember that our `world` contains
candy and the cursor, but we've been using `null` so far for the
cursor, so let's update the world to place the cursor top left
using `make-posn`

.. code-block:: racket
   :emphasize-lines: 3

   (big-bang
      (world (build-list (* WIDTH HEIGHT) random-tile)
             (make-posn 0 0))            
     (to-draw draw-world))

Now we need to draw the cursor in the right place. Update your
`draw-world` function like so -- and don't forget the extra bracket on
the end of the last line.

.. code-block:: racket
   :emphasize-lines: 2,5
		     
   (define (draw-world w)
     (cursor+scene (world-cursor w)
		   (candy+scene (world-candy w) 
				(empty-scene (* WIDTH BLOCK-SIZE)
					     (* HEIGHT BLOCK-SIZE) "black"))))

We can now define the new `cursor+scene` function to place the
cursor. This is nice and simple because we've only one bitmap to
place. Add this function:

.. code-block:: racket

   (define (cursor+scene cursor scene)
     (place-image (bitmap "images/selected.png")
		  (posn-x cursor) (posn-y cursor)
		  scene))

When you run this you'll see that the cursor appears, but we have the
same old problem of the bitmap being partially off the screen. Also
there's another problem: we're not multiplying the `x` and `y` by the
block size `BSIZE`.

Given that we've done this before, let's fix this with a helper
function that takes the `x` and `y` position and returns the correct
pixel position.






