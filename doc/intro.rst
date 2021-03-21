.. _intro:

Intro to Racket
===============

Let's try some things out now so that you can get a little familiar
with the Racket programming language.


A little introduction to Racket
-------------------------------

Start up DrRacket and you'll see two panels. On the left side you can
write your program and on the right side you have a REPL (pronounced
repple) where you can try things out.

At the top of the REPL panel you'll see something like this:

.. code:: racket

   Welcome to DrRacket, version 7.7 [3m].
   Language: racket, with debugging; memory limit: 128 MB.
   > 

That :code:`>` prompt is inviting you to type something in. So let's
do that, enter each line below, pressing enter after each one.

.. code:: racket

   (+ 5 7)

   (* 2 3 4)

You should see the results `12` and `24`.

So in racket every command has the same structure: an open bracket,
the function you want, the things you want the function to work
on, and ending with a close bracket.

And the things can be functions too, try this:

.. code:: racket

   (/ (* 1 2 3) (* 4 5 6))

This divides `1*2*3` by `4*5*6`. It might seem a bit weird to have to put
all those brackets in, but notice that there's absolutely no confusion
about what sum you want. It's certainly clearer than `1*2*3/4*5*6`.

Now try these functions:

.. code:: racket

   (string-append "hello" "world")

   (range 100)
	  
You should see `helloworld` (with no space) and a long list of numbers
from 0 to 99. 

So that second function returns a list. Lists are very common in Racket,
what can we do with them? Let's try a few things...

.. code:: racket

   (reverse (range 10))

   (shuffle (range 10))

   (group-by odd? (range 10))

Did you notice that these all return lists too? And that the
`group-by` function returns a list with lists inside it.

If you want to find out more about a function you can click on it and
press F1, or use the blue help arrow at the top right of the panel. Racket
has excellent built in documentation.

Now you are ready for :ref:`part1`.
