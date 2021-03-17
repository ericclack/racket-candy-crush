.. _talk:

Why learn Racket? Why teach Racket?
===================================

Hello everyone!
---------------

I'm Eric Clack.

I mentor at Brighton Coder Dojo -- a code club for 6-17 year olds.

And I've a question: why learn Racket? Why teach it at Coder Dojo?

Coder Dojo
----------

At Coder Dojo our aim is to inspire and develop great
programmers. Programmers that have a deep understanding of how code
works. Programmers that can create amazing things on their computers.

At code clubs young people typically start with a block-based
programming language such as Scratch. 

[Really quick demo of moving a cat]

Scratch is really cool, you can create amazing programs in it. However
kids outgrow it, so when they are ready they move on to a text-based
programming language, usually Python.

But why not something else? 

A case for Racket
-----------------

I think Python is a great language, but it seems to me that kids are
missing out by not exploring more broadly, and maybe Racket is
actually a better place to start?

So I'm going to try and make that case! 

How?
----

Let's compare Racket and Python from the point of view of someone
learning a text-based language for the first time.

Let's look at a game tutorial I wrote for Candy Crush in Python and one I'm
working on now in Racket. How do they compare?

- `Python Candy Crush Tutorial`_
- `Racket Candy Crush Tutorial`_

The REPL
--------

Let's start by looking at the REPL. It's great that both languages have one.

.. code:: python

   5 + 7

   1 * 2 * 3 * 4 * 5

   "hello" + "world"

   alist = [1,2,3,4,5,6,7,8,9]

   shuffle(alist)

And in Racket: 
   
.. code:: racket
          
   (+ 5 7)

   (* 1 2 3 4 5)

   (range 20)

   (shuffle (range 20))
   

Observations:

- REPLs are great
- Notice that in Python shuffle changes the list, Racket
  returns a new one

Showing the candy
-----------------

OK, over to Candy Crush.

Python
......

Starting out:

- empty game world -- not much typing
- adding a tile -- no problems, easy
- adding many more tiles -- kind of OK, not sure why this works
- adding the cursor -- OK
- moving the cursor -- Ah! my world keeps changing!

Why? It is hard to see, but there is no game state yet.

We're just drawing random things on the screen.
  
For most kids fixing this is confusing: we need lists + loops +
indexing.


Racket
......

Let's see how this works in Racket. In the tutorial we start out in
the REPL to try out ideas before writing code in our program. 

Starting with candy1a.rkt.

- single image -- with `bitmap/file`
- numbers to images -- add function `candy->bitmap`
- see our world as a list of tiles
- use map to make it

See how we can do so much in the REPL to try ideas before writing
code into our program?



Another look at the REPL
------------------------

Try something that works in both:

- what?

Now for something more interesting: 
  
- Try to run draw() in python
- Do same in Racket :) 
  

Some more observations on Python
----------------------

Brackets, commas, quotes are confusing. They've not seen these things
before in Scratch.

Nested things are confusing, such as if-statements containing anything
beyond the simplest statement. Both the concept of things inside
conditionals, and the indentation.

Poor concept of functions.

Often functions do something to the world and it is hard to know when
to call them. If you call them in the wrong place it doesn't work.

However, some kids do get there and get to the point where they
can make their own games and mentor other kids.


What we know
------------

Kids at the club are really motivated to learn to program. They know
when they are ready to step up from Scratch. When they see the game
tutorials they really want to create Candy Crush, Flappy Bird, etc.

They love quick results with little code.

They don't often understand what they are doing, but copy code seems
to work.

Making that leap from copying to understanding is really hard -- many
don't make it. We see this when things don't work. 


What's seems nice about Racket?
-------------------------------

Everything looks like this::

  (fn a b c d e)

Functions just convert some input thing to a new output thing. They
are easy to understand because there are no side effects.

Functions can return images, which appear in the REPL. 

Test as you go: you can run almost any part of your program in the
REPL because most functions are pure so you don't need to set up any
state.

Map and filter seem simpler ways to think about processing lists
than loops. 

And what seems challenging?
...........................

Brackets, especially all those closing brackets with compound
statements.

Maths with prefix notation is weird coming from regular
maths. Although there's no confusion with BODMAS for complex
expressions.

Compared with Pygame Zero there is a bit more set up code. 

So why learn Racket?
--------------------

In my mind the number one reason is this:

With Racket you've got a much better chance of understanding how
code works, by working on little functions that do simple things
that you can easy test for yourself in the REPL.

But! You need to know the Racket (Scheme) way. And a Racket tutor!
  
Some other advantages: 

- There's less new stuff (syntax elements) to take in when moving from
  Scratch.
- A more natural way to deal with lists of things.
- You can take what you learn to other languages.

The challenges
..............

Who can teach you?

Pros and cons of being a programming polygot. More work, broader
understanding of the conceps.

What next?
----------

Tell me what you think! 

I'll publish this tutorial soon, you can see it on github my id is my name ericclack.

Will I try it at Coder Dojo?

What about the case for professional programmers to try it?

.. _Python Candy Crush Tutorial: https://pygamezero-candy.readthedocs.io/en/latest/
.. _Racket Candy Crush Tutorial: https://github.com/ericclack/racket-candy-crush/blob/master/doc/index.rst
