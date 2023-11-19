# List Comprehensions

List comprehensions are ways to build and modify lists

List comprehensions are based on set notation

Set notation tells your how to build a set by specifying
properties its members must satisfy

__Example__

Given the set `{2n : n in L}` where `L = [1,2,3,4]`, the
Erlang implementation would be:

```erlang
1> [2*N || N <- [1,2,3,4]].
[2,4,6,8]
```

Constraints can be add to a list comprehension by using
operations that return boolean values.

__Example__

All numbers `1` through `10` that are even, the Erlang
implementation would be:

```erlang
1> [X || X <- [1,2,3,4,5,6,7,8,9,10], X rem 2 =:= 0].
[2,4,6,8,10]
```

Notice how variables that are declared as part of the list
comprehension can be used to create readable constraints
on the overall evalutation

__Example__

Get all items from a restruant menu that are between price
of 3 and 10, then multiple by a 7% sales tax.

```erlang
1> Menu = [{steak, 5.99},{beer, 3.99},{poutine, 3.50},{kitten, 20.99},{water, 0.00}].
[{steak,5.99},{beer,3.99},{poutine,3.5},{kitten,20.99},{water,0.0}]

2> [{Item, Price * 1.07} || {Item, Price} <- Menu, Price >= 3, Price =< 10].
[{steak,6.409300000000001},{beer,4.2693},{poutine,3.745}]
```

### Generator Expressions

The syntax `Pattern <- List` is named a Generator expression

A single list comprehension can have multiple of these

```erlang
1> [X+Y || X <- [1,2], Y <- [3,4]].
[4,5,5,6]
```

This runs the operations `1+2`, `1+4`, `2+3`, `2+4`


#### Pattern Matching as a Filter

Generator expressions couple with pattern matching also
act as a filter:

```erlang
1> Weather = [
.. {toronto, rain},
.. {montreal, storms},
.. {london, fog},
.. {paris, sun},
.. {boston, fog},
.. {vancouver, snow}
.. ].

2> FoggyPlaces = [Location || {Location, fog} < Weather].
[london, boston]
```
