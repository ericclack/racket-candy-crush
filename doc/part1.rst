.. _part1:

Part 1
======

Creating our game world
-----------------------

Let's start by making a blank game screen -- so on the left hand side,
type in the following code. There's a few lines here so take your
time. Try not to just copy and paste because the typing is good
practice and it helps you remember the commands.

.. code:: racket

   #lang racket
   (require 2htdp/universe)
   (require 2htdp/image)

   (define WIDTH 8)
   (define HEIGHT 10)
   (define BSIZE 40)

   (define (draw-world w)
     (empty-scene (* WIDTH BSIZE)
		  (* HEIGHT BSIZE) "blue"))

   (big-bang null
     (to-draw draw-world))


Now press Run. You should see a new window with a blue background.

Let's step through that so we understand what's going on:

* First we tell Racket that we are using the Racket language with
  `#lang` -- this might seem an odd thing to have to say, but racket
  actually supports lots of different languages.
* Now we bring in a few modules that we need later in the program with
  `require`
* We have 3 constants that we use that define how big the game world
  will be: `WIDTH`, `HEIGHT` AND `BSIZE`, the block size.
* Next we tell racket how to draw our world -- and at the moment it is
  simply an `empty-scene` of the right size with a blue background.
* Finally `big-bang` creates our world with a single function: a link
  to how to draw the game.

If you've not done so already, save your file and make a directory to
keep your game files and images tidy -- and so that you can find them
again later.

Don't forget to download the images
-----------------------------------

Did you download the images (with instructions on the previous page)?
Check that you put them in a directory called `images`, your code
directory should look something like this:

- candy.rkt
- images/
   - 1.png
   - 2.png
   - etc

Add the candy tiles
-------------------

So how do we actually draw the tiles? Let's see first if we can get
one tile on the screen.

In the REPL, type this code in:

.. code:: racket

   (bitmap/file "images/1.png")

You should see a light blue tile in the REPL. You can try different numbers,
there are tiles all the way up to 8.

We're going to represend our game world with a simple list like this:

.. code:: racket

   (list 1 2 3 4 5 6 7 8)

So how do we turn this list of tile numbers into a grid of images? 

From numbers to images
......................

We can see where the number goes in our code :code:`(bitmap/file
"images/1.png")`, it's between the `/` and the `.png`. Let's do this
transformation in a function.

First add this function to your code above your `draw-world` function: 

.. code:: racket

   (define (candy->bitmap number)
	  (bitmap/file "images/1.png"))

You might notice that it doesn't use the number yet, so run your code,
then in the REPL try this out:

.. code:: racket

   (candy->bitmap 1)

   (candy->bitmap 3)

   (candy->bitmap 8)

So it always produces the same tile because we don't use the
:code:`number` argument. Here's how we get the number in the file
name.

In the code that follows we've highlighted the new code in yellow.

.. code-block:: racket
   :emphasize-lines: 2,3,4

   (define (candy->bitmap number)
	  (bitmap/file (string-append "images/"
	                              (number->string number)
				      ".png")))

Again, run your code, then in the REPL try these lines out again --
now it works:

.. code:: racket

   (candy->bitmap 1)

   (candy->bitmap 3)

   (candy->bitmap 8)

Using `map` to draw lots of candy
.................................

So we have our list of candy `(list 1 2 3 4 5 6 7 8)`, and a functions
to get the bitmap. We've seen how we take one value (one piece of
candy) and get the bitmap or position, but how do we do this for a
list?

Using `map`. This function takes a function and a list and applies the
function to every item in the list. Sounds confusing? It's actually
easy to understand when you see it in action.

Type this in the REPL:

.. code-block:: racket

   (map candy->bitmap (list 1 5 1 5 1 5))

You should see 6 pieces of candy -- pretty cool hey? You can try
longer lists to see what happens.

From the REPL to our game code
------------------------------

Let's take what we've learnt in the REPL and add it to our game code. 

First we need to create a structure to represent our world. The new
code is highlighted yellow.

.. code-block:: racket
   :emphasize-lines: 5

   (define WIDTH 8)
   (define HEIGHT 10)
   (define BSIZE 40)

   (struct world (candy cursor))

So our world is some `candy` and a `cursor`. Now we can add a list of
candy when we create our game with `big-bang`:
   
.. code-block:: racket
   :emphasize-lines: 2

   (big-bang
      (world (list 1 2 3 4 5 6 7 8) null)
      (to-draw draw-world))

If you run this now, you won't see anything different, that's because
we are not drawing the world in our `draw-world` function. So let's add
the code to do this:

.. code-block:: racket
   :emphasize-lines: 1-5,8

   (define (candy+scene candy scene)
     (place-images
      (map candy->bitmap candy)
      ;; We need to supply positions for our images here
      scene))
   
   (define (draw-world w)
     (candy+scene (world-candy w) 
		  (empty-scene (* WIDTH BSIZE)
			       (* HEIGHT BSIZE) "black")))

We're using the function `place-images` which takes a list of images
(which we have) and a list of positions, which we don't have. These
positions are co-ordinates on the screen.

Positioning the candy
---------------------

Let's start by just assuming that our world is only one line of tiles.

We can see that each tile would be 40 pixels across from the last one,
since that's the size of each block, so here's how we can map from
tile number to position:

.. code:: racket

   (define (number->posn number)
      (* number BSIZE))

Let's try it in the REPL:

.. code:: racket

   (number->posn 1)

   (number->posn 10)

You should get results `40` and `400`. That shouldn't be too
surprising, that function just multiplies our number by 40.

As before we can use `map` to make a list of positions for our game
world. Notice that we just use `(range 10)` here instead of
our list of candy because we need a list of the numbers from 0
upwards. 

.. code:: racket

   (map number->posn (range 10))

This is just the x-position, we need the y-position too. We can use a
struct called `posn` to do this. Add this `require` statement to the
top of your program:

.. code-block:: racket
   :emphasize-lines: 3

   (require 2htdp/universe)
   (require 2htdp/image)
   (require lang/posn)

Now we can update our function:

.. code-block:: racket
   :emphasize-lines: 2

   (define (number->posn number)
      (make-posn (* number BSIZE) 0))

Let's try it in the REPL: ::

   (map number->posn (range 10))

This is more interesting, now we see a list of: ::

  (list
   (posn 0 0)
   (posn 40 0)
   (posn 80 0)
   (posn 120 0)
  

Putting it all together
-----------------------

So let's use this in our new function :code:`candy+scene`:

.. code:: racket

   (define (candy+scene candy scene)
     (place-image (bitmap/file "images/1.png")
		  0 0 
		  scene))
      
When you run this you'll see that the image is just visible, but half
off the top of the screen. Let's fix that...

.. code-block:: racket
   :emphasize-lines: 4

   (define (candy+scene candy scene)
     (place-image/align (bitmap/file "images/1.png")
			0 0
			"left" "top"
			scene))

OK, so we've drawn one tile, not very impressive yet! Looking
back at our world, we actually have 3 tiles: :code:`(list 1 2 3)`
so how do we draw these?

We need to do two things:

1. Map the numbers to the images
2. Work out the position of each tile.

We can do both these things with functions, let's work on the images first.

What position to draw each tile?
................................




What about the positions? What do we use here? Well we just need a
list of numbers starting at zero and increasing by one each
time. `range` does this for us:

.. code-block:: racket

   (range 6)

   (map number->posn (range 6))

Putting it all together
-----------------------

Now we can fix our function `candy+scene` so that it uses our two new
functions and `map` to get the right image and use the right
placement.

Change your `candy+scene` function to the following:

.. code-block:: racket
   :emphasize-lines: 2,3

   (define (candy+scene candy scene)
     (place-images/align (map candy->bitmap candy)
			 (map number->posn (range (length candy)))
			 "left" "top"
			 scene))

Run it and see what happens. Go back and add some more candy to your
world too, just update the `list` in your `big-bang` function:

.. code-block:: racket
   :emphasize-lines: 1

   (big-bang (world (list 1 2 3 4 5 6 7 8) null)            
            (to-draw draw-world))

Lots of candy!
		    
In :ref:`part2` we'll make a grid of tiles and add the moving cursor. 
