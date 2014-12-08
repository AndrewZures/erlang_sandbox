-module(test).
-export([head/1, second/1, same/2, right_age/1, hello/3]).

head([H|_]) -> H.
second([_,X|_]) -> X.

same(X,X) -> true;
same(_,_) -> false.

right_age(X) when X > 16; X < 104 -> true;
right_age(_) -> false.

hello(A,B,C) when (A > 20 orelse B > 10) andalso C > 10 -> A + B + C;
hello(A,B,C) ->  -A - B - C.
