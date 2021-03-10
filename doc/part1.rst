.. _part1:

Part 1
======

Let's create our first program
------------------------------

Now on the left hand side, type in the following code:

.. code:: racket

   #lang racket
   (require 2htdp/universe)
   (require 2htdp/image)

   (define WIDTH 8)
   (define HEIGHT 10)
   (define BLOCK-SIZE 40)

   (define (draw-world w)
     (empty-scene (* WIDTH BLOCK-SIZE)
		  (* HEIGHT BLOCK-SIZE) "blue"))

   (big-bang null
     (to-draw draw-world))


Now press Run. You should see a new window with a blue background.

Let's step through that so we understand what's going on:

* First we tell Racket that we are using the Racket language -- this
  might seem an odd thing to have to say, but racket actually supports
  lots of different languages.
* Now we bring in a few modules that we need later in the program with
  `require`
* We have 3 constants that we use that define how big the game world
  will be: `WIDTH`, `HEIGHT` AND `BLOCK-SIZE`
* Next we tell racket how to draw our world -- and at the moment it is
  simply an `empty-scene` of the right size with a blue background.
* Finally `big-bang` creates our universe (our game) with a single
  function: a link to how to draw the game.

If you've not done so already, save your file and make a directory to
keep your game files and images tidy -- and so that you can find them
again.
  
Let's add some tiles
--------------------

Did you download the images (with instructions on the previous page)? First
check that you put them in a directory called `images` then add the code below.

First let's create a structure to represent our world. In the code that
follows we've highlighted the new code in yellow.

.. code-block:: racket
   :emphasize-lines: 5

   (define WIDTH 8)
   (define HEIGHT 10)
   (define BLOCK-SIZE 40)

   (struct world (candy cursor))


So our world is some `candy` and a `cursor`. Now we can add a list of
candy when we create our game with `big-bang`:
   
.. code-block:: racket
   :emphasize-lines: 2

   (big-bang
      (world (list 1 2 3) null)
      (to-draw draw-world))

If you run this now, you won't see anything different, that's because
we are not drawing the world in our `draw-world` function. So let's add
the code to do this now:

.. code-block:: racket
   :emphasize-lines: 2

   (define (draw-world w)
     (candy+scene (world-candy w) 
		  (empty-scene (* WIDTH BLOCK-SIZE)
			       (* HEIGHT BLOCK-SIZE) "black")))

Run the code above to see what happens.

Brackets!
---------

You probably added the yellow line above and when you ran it you got an error:

.. code:: racket

   read-syntax: expected a `)` to close `(`
   possible cause: indentation suggests a missing `)` before line 35

That's because we added another function inside `draw-world` called
`candy+scene` (which adds candy to the scene), which uses the
`empty-scene` as a starting point. These are nested functions and
we're missing a bracket from the end.

Nesting is when we place one thing inside another, if we draw it out
for the code above it looks like this: 

.. code::

   +-------------------------------+
   | draw-world                    |
   |     +-----------------------+ |
   |     | candy+scene           | |
   |     |     +---------------+ | |
   |     |     | empty-scene   | | |
   |     |     +---------------+ | |
   |     +-----------------------+ |
   +-------------------------------+

This nesting is very common in Racket, and in fact all programming languages,
so it is good to recognise.

Drawing the tiles
-----------------

So how do we actually draw the tiles? Let's see first if we can get one tile
on the screen.

In the REPL, type this code in:

.. code:: racket

   (bitmap/file "images/1.png")

You should see a light blue tile in the REPL. You can try different numbers,
there are tiles all the way up to 8.

So let's use this in our new function :code:`candy+scene`:

.. code:: racket

   (define (candy+scene candy scene)
     (place-image (bitmap/file "images/1.png")
		  0 0 
		  scene))
      
When you run this you'll see that the image is just visible, but half
off the top of the screen. Let's fix that...

.. code-block:: racket
   :emphasize-lines: 3

   (define (candy+scene candy scene)
     (place-image (bitmap/file "images/1.png")
		  (/ BLOCK-SIZE 2) (/ BLOCK-SIZE 2) 
		  scene))

OK, so we've drawn one tile, not very impressive yet! Looking
back at our world, we actually have 3 tiles: :code:`(list 1 2 3)`
so how do we draw these?

We need to do two things:

1. Map the numbers to the images
2. Work out the position of each tile.

We can do both these things with functions, let's work on the images first.

From numbers to images
......................

So we need to turn a number into something like :code:`(bitmap/file "images/1.png")`

Add this function under your :code:`world` struct:

.. code:: racket

   (define (candy->bitmap number)
	  (bitmap/file "images/1.png"))

Run your code, then in the REPL try this out:

.. code:: racket

   (candy->bitmap 1)

   (candy->bitmap 3)

   (candy->bitmap 8)

Ah, so it always produces the same tile, that's because we don't use
the :code:`number` argument. Here's how we get the number in the file
name:

.. code-block:: racket
   :emphasize-lines: 2

   (define (candy->bitmap number)
	  (bitmap/file (string-append "images/" (number->string number) ".png")))

Again, run your code, then in the REPL try these lines out again -- now it works: 

.. code:: racket

   (candy->bitmap 1)

   (candy->bitmap 3)

   (candy->bitmap 8)
	  
What position to draw each tile?
................................

Let's start by just assuming that our world is only one line of tiles.

We can see that each tile would be 40 pixels across from the last one,
and checking back to the code above we know that we want to place
tiles using half the block size so that they are fully on screen.

So here's how we can map from tile number to position:

.. code:: racket

   (define (number->posn number)
      (* number 40))

Let's try it in the REPL:

.. code:: racket

   (number->posn 1)

   (number->posn 10)

You should get results `40` and `400`. That shouldn't be too surprising,
that function just multiplies our number by 40. 

This is just the x-position, we need the y-position too. We can use a struct
called `posn` to do this. Add this `require` statement to the top of your program:

.. code-block:: racket
   :emphasize-lines: 3

   (require 2htdp/universe)
   (require 2htdp/image)
   (require lang/posn)

Now we can update our function:

.. code-block:: racket
   :emphasize-lines: 2

   (define (number->posn number)
      (make-posn (* number 40) 0))

Let's try it in the REPL:

   (number->posn 1)

   (number->posn 10)

This is more interesting, now we see results `(posn 40 0)` and `(posn 400 0)`.

Putting it all together
.......................

Now we can fix our function `candy+scene` so that it uses our two new functions
to get the right image and use the right placement.

Change your `candy+scene` function to the following:


.. code-block:: racket
   :emphasize-lines: 2

   (define (candy+scene candy scene)
      (place-images (bitmap/file "images/1.png")
		   (/ BLOCK-SIZE 2) (/ BLOCK-SIZE 2) 
                   scene))
