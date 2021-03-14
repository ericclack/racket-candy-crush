.. _talk:

Talk
====

Why learn Racket? Why teach Racket? 
-----------------------------------

Let's compare it to Python, and Pygame Zero with the Mu editor.

Audience: Kids coming from Scratch and trying a text-based language
for the first time.

Observations on Python
----------------------

Kids are really motivated.

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
---------------------------

Brackets, especially all those closing brackets with compound
statements.

Maths with prefix notation is weird coming from regular
maths. Although there's no confusion with BODMAS for complex
expressions.

Compared with Pygame Zero there is a bit more set up code. 
