# Lists

Lists can contain any data type in a single list

```erlang
1> [1, 2, 3, {numbers, [4, 5, 6]}, 5.34, atom].
[1, 2, 3, {numbers, [4, 5, 6]}, 5.34, atom]
```

Strings are lists and the notion is the same. This can be
confusing at first but also makes sense in the grand scheme
of Erlang

```erlang
1> [97, 98, 99].
"abc"
```
