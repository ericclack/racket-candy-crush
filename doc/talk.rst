.. _talk:

Talk
====

Why learn Racket? Why teach Racket?
-----------------------------------

Bit about me
............

A bit of background: I mentor at Brighton Coder Dojo and we've written
a number of tutorials for young people new to Python. I've also
created various Racket games examples over the years, with an idea
that they may work at our code club. But I've never used them. Maybe
because I've never tried to answer the question: why learn Racket?

Way back in my professional life I've been a coder in C, C++, Python,
JavaScript. I also love to play with a wide range of languages. --
and more recently I've been a project manager,
scrummaster, team leader and now I run a software development company.

Learning to program
...................

At code clubs for young people (6-16 year olds) people typically start
with a block-based programming language such as Scratch. When they are
ready they move on to a text-based programming language, usually
Python.

But what about Racket? It's got a great environment, it's good with
graphics, pretty concise (so not too much typing) but I've not seen it
at any code club.

So can I make a case for learning Racket, and teaching Racket? Will I
convince some young people to try it?

The question: Why learn Racket? Why teach Racket? 
--------------------------------------------------

Why teach any language? Our aim is to inspire and develop great
programmers.

How can we answer the question?
-------------------------------

Let's look at a game tutorial for Candy Crush.

Well let's explore Python and Racket. (In Python with what we use at
Coder Dojo: Pygame Zero with the Mu editor).

Remember our audience: Kids coming from Scratch and trying a
text-based language for the first time.

The REPL
--------

Great that both languages have a REPL.
Quick look.
We'll come back here in a tick.

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

Kids are really motivated, [what kind of motivation?]

Quick results with little code.

They don't often understand what they are doing, but it seems to work.

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

There's less new stuff (syntax elements) to take in when moving from
Scratch.

Test as you go with the REPL.

Really learn what functions do.

A more natural way to deal with lists of things.

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
