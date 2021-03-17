.. _talk:

Talk
====

Why learn Racket? Why teach Racket?
-----------------------------------

Bit about me
............

A bit of background: I mentor at Brighton Coder Dojo -- a code club
for 6-17 year olds. Way back in my professional life I've been a coder
in C, C++, Python, JavaScript. I also love to play with a wide range
of languages.

At Coder Dojo We've written a number of tutorials for young people new
to Python. I've also created various Racket games examples over the
years, with an idea that they may work at our code club. But I've
never used them. Maybe because I've never tried to answer the
question: why learn Racket?


Learning to program
...................

At code clubs young people typically start with a block-based
programming language such as Scratch.

[Really quick demo of moving a cat]

When they are ready they move on to a text-based programming language,
usually Python.

But what about Racket? It's got a great environment, it's good with
graphics, pretty concise (so not too much typing) but I've not seen it
at any code club.

So can I make a case for learning Racket, and teaching Racket?

Will I convince some young people to try it?

The question: Why learn Racket? Why teach Racket? 
--------------------------------------------------

Why teach any language?

Our aim is to inspire and develop great programmers. Programmers
that have a deep understanding of how code works.

How can we answer the question?
-------------------------------

Let's compare Racket and Python from the point of view of someone
learning a text-based language for the first time.

Let's look at a game tutorial for Candy Crush.


What we know
------------

Kids at the club are really motivated to learn to program. They know
when they are ready to step up from Scatch. When they see the game
tutorials they really want to create Candy Crush, Flappy Bird, etc.

They love quick results with little code.

They don't often understand what they are doing, but copy code seems
to work.

Making that leap from copying to understanding is really hard -- many
don't make it. We see this when things don't work. 


The REPL
--------

It's great that both languages have a REPL.
Let's take a quick look.

.. code:: python

   5 + 7

   1 * 2 * 3 * 4 * 5

   "hello" + "world"

   range(20)

   alist = [1,2,3,4,5,6,7,8,9]

   shuffle(alist)

.. code:: racket
          
   (+ 5 7)

   (* 1 2 3 4 5)

   (string-append "hello" "world")

   (range 20)

   (shuffle (range 20))
   

Observations:
- REPLs are great
- Python generators are cool, but not easy to understand
  for a beginner
- Notice that in Python shuffle changes the list, Racket
  returns a new one

We'll come back to the REPL soon

Showing the candy
-----------------

Python
......

Starting out:
- adding some tiles
- adding the cursor
- ah! my world keeps changing!

For most kids the next bit is confusing: lists + loops + indexing. 


Racket
......

Starting with candy1a.rkt

REPL:
- single image
- numbers to images
- map

Another look at the REPL
------------------------

Try something that works in both

Try to run draw() in python
Do same in Racket :) 
  

Observations on Python
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

But! You need to know the Racket (Scheme) way. 
  
And: 

There's less new stuff (syntax elements) to take in when moving from
Scratch.

A more natural way to deal with lists of things.

You can take what you learn to other languages.

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

The case for professional programmers to try it?
