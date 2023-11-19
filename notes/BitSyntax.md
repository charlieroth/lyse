# Bit Syntax

Almost every programming language has syntax support for
dealing with numbers, atoms, tuples, lists, structures,
etc., but very few have direct language support for working
with binary data. Erlang provides powerful abstractions
when dealing with binary values with pattern matching.

This language support was necessary for telecom applications,
which Erlang was created for.

Bit syntax encloses binary data between `<<` and `>>`,
splits it in readable segments, and each segment is
separated by a comma

__Example__

Say we are dealing with a stream of color pixels that are
each a binary of width `24` and we know that the `RGB`
signal can be split into `3` `8` bit segments. Knowing
this we can pattern match to effectively decode this binary
stream:

```erlang
1> Color = 16#F09A29.
15768105

2> Pixel = <<Color:24>>.
<<240,154,41>>

3> Pixels = <<213,45,132,64,76,32,76,0,0,234,32,115>>.
<<213,45,132,64,76,32,76,0,0,234,32,115>>

4> <<Pix1,Pix2,Pix3,Pix4>> = Pixels.
** exception error: no match of right hand side value
                    <<213,45,132,64,76,32,76,0,0,234,32,115>>

5> <<Pix1:24,Pix2:24,Pix3:24,Pix4:24>> = Pixels.
<<213,45,132,64,76,32,76,0,0,234,32,115>>

6> <<R:8,G:8,B:8>> = <<Pix1:24>>.
<<213,45,132>>

7> R.
213
```

You can also pattern match on the whole pixel stream and
extract the same `R` value of the first pixel.

```erlang
8> <<R:8, Rest/binary>> = Pixels.

9> R.
213
```
