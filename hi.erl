-module(hi).
-export([fine/1, insert/2]).

fine(N) ->
  Talk = if N =:= 1 -> "one";
            N =:= 2 -> "two";
            true -> "three"
          end,
  {hello, "the number is " ++ Talk ++ "!"}.


insert(X, []) -> [X];
insert(X, Set) ->
  case lists:member(X, Set) of
      true -> Set;
      false -> [X|Set]
  end.
