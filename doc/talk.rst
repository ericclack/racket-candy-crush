.. _talk:

Why learn Racket? Why teach Racket?
===================================

Set up
------

Open up: 

- Mu editor with `candy-test0.py` + REPL visible
- Racket with `candy1a.rkt` + empty tab for REPL
- Browser with https://scratch.mit.edu/projects/editor/
- Browser with https://pygamezero-candy.readthedocs.io/en/latest/

Run:

- Python:
  import random
  

Hello everyone!
---------------

I'm Eric Clack.

I mentor at Brighton Coder Dojo -- a code club for 6-17 year olds. I
also run a software product company in Brighton.

And I've a question: why learn Racket? Why teach it at somewhere like
Coder Dojo?

I've been thinking about this question for a while, here's where I've
got to. Perhaps you can help?

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

Before we get to the tutorials let's take a quick look at the REPL.

It's great that both languages have one!

.. code:: python

   1 * 2 * 3 * 4 * 5

   "hello" + "world"

   alist = [1,2,3,4,5,6,7,8,9]

   random.shuffle(alist)

And in Racket: 
   
.. code:: racket
          
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

  Set up: Switch to PygameZero mode.

Python
......

Starting out: 

- empty game world -- not much typing
- adding a tile with `screen.blit` -- no problems, easy
- adding more tiles with duplication -- easy
- adding many more tiles with a loop -- kind of OK, not sure why this works
- adding the cursor -- OK
- moving the cursor -- Ah! my world keeps changing!

Why? It is hard to see, but there is no game state yet.

We're just drawing random things on the screen.
  
For most kids fixing this is confusing: we need lists + loops +
indexing.


Racket
......

Let's see how this works in Racket. In the tutorial we use the REPL
a fair bit to try out ideas before writing code in our program. 

Starting with candy1a.rkt and candy2c.rkt in another tab:

- our empty game world -- more code than Python
- single image -- with `bitmap/file`
- numbers to images -- add function `candy->bitmap`
- see our world as a list of tiles -- (list 1 2 3 4 ...)
- use map to make it

See how we can do so much in the REPL to try ideas before writing
code into our program?


More stuff in the REPL
......................

Looking ahead to a later version of our game world we can
do some pretty cool things in the REPL.

We can draw our world::

  (draw-world (world (list 1 2 3) (make-posn 0 0)))

We can test functions, like this one that moves the cursor::
  
  (move-posn (make-posn 5 5) -1 0)

We can make lists and draw them::
  
  (draw-world (world (make-list 100 5) (make-posn 1 2)))

Or even::
  
  (draw-world (world
               (flatten (map cons
                             (make-list 50 1)
                             (make-list 50 5)))
               (make-posn 1 2)))

So because most of the functions in our game are pure functions,
that is they transform an input to an output and don't have any
side effects, we can test them out in the REPL.
  

What's good about Racket?
-------------------------

There's several things that I think make it a great language
to learn to program in.

Consistency: Everything looks like this::

  (fn a b c d e)

Functions just convert some input thing to a new output thing. They
are easy to understand because there are no side effects.

Functions can return images, which appear in the REPL. 

Test as you go: you can run almost any part of your program in the
REPL because most functions are pure so you don't need to set up any
state.

So in my mind this is the number one reason to learn Racket: 

  You've got a much better chance of understanding how code works, by
  working on little functions that do simple things that you can test
  for yourself in the REPL.

But! You need to know the Racket (or Scheme) way, and a Racket tutor!


Questions
---------

Writing this talk has raised lots of questions, for example:

- Have I been fair on Python?
- 
  - - Can we have the REPL available when running our game? 

Thank you for watching. I hope this has got you thinking: why learn
and why teach Racket.

I would love to hear what you think! 

I will publish this tutorial soon on Read the Docs. It is on github
already -- my id is just my name ericclack.

 

.. _Python Candy Crush Tutorial: https://pygamezero-candy.readthedocs.io/en/latest/
.. _Racket Candy Crush Tutorial: https://github.com/ericclack/racket-candy-crush/blob/master/doc/index.rst


---------


More thoughts
-------------

Kids at the club are really motivated to learn to program. They know
when they are ready to step up from Scratch. When they see the game
tutorials they really want to create Candy Crush, Flappy Bird, etc.

They love quick results with little code.

They don't often understand what they are doing, but copy code seems
to work.

Making that leap from copying to understanding is really hard -- many
don't make it. We see this when things don't work. 


Some more observations on Python
................................

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


More on Racket
..............

Some other advantages: 

Map and filter seem simpler ways to think about processing lists
than loops. 

- There's less new stuff (syntax elements) to take in when moving from
  Scratch.
- A more natural way to deal with lists of things.
- You can take what you learn to other languages.

And what seems challenging?
...........................

Brackets, especially all those closing brackets with compound
statements.

Maths with prefix notation is weird coming from regular
maths. Although there's no confusion with BODMAS for complex
expressions.

Compared with Pygame Zero there is a bit more set up code. 
  

Questions
.........

Can we have the REPL available whilst running the game in Racket? 

