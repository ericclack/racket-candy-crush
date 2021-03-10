.. _intro:

Intro to Racket
===============

A little introduction to Racket
-------------------------------

Start up DrRacket and you'll see two panels. On the left side you can
write your program and on the right side you have a REPL (pronounced
repple) where you can try things out.

Let's try some things out now so that you can get a little familiar
with Racket.

At the top of the panel you'll see something like this:

.. code:: racket

   Welcome to DrRacket, version 7.7 [3m].
   Language: racket, with debugging; memory limit: 128 MB.
   > 

That :code:`>` prompt is inviting you to type something in. So let's
try it out, enter each line below, pressing enter after each one.

.. code:: racket

   (+ 5 7)

   (* 2 3 4)

You should see the results `12` and `24`. Now try these:

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


