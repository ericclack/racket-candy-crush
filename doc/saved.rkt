Brackets!
.........

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
