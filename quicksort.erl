-module(quicksort).
-export([quicksort/1, lc_quicksort/1]).

%% [3,2,4,1]
%% qucksort[3,[2,4,1]
%%  --> partition(3, [2 | [4,1]], [], [])   : 2 =< 3
%%    --> partition(3, [4 | [1], [2], [])   : 4 >  3
%%      --> partition(3, [1|[]], [2], [4])  : 1 =< 3
%%        --> partition(3, [], [1,2], [4])  : return { [1,2], [4] }
%%  <-------
%%  status: quicksort([1,2]) ++ [3] ++ quicksort([4])
%%
%%  quicksort([1.2]
%%    --> partition(1,[2|[]], [], [])       : 2 >  1
%%      --> partition(1,[], []. [2])        : return { [], [2] }
%%    <-------
%%    status quicksort([]) ++ [1] ++ quicksort([2])
%%      --> quicksort([]) trivial
%%      --> quicksort(2, [], [], []) return { [], [] }
%%          --> quicksort([]) ++ [2] ++ quicksort([])   : return [2]
%%    <------
%%    status [] ++ [1] ++ [2] : return [1,2]
%%  <------
%%  status: [1,2] ++ [3] ++ quicksort([4])
%%  --> quicksort([4])   : trivial : return [4]
%%  <------
%%  status: [1,2] ++ [3] ++ [4] : return [1,2,3,4]
%%<------
%%result [1,2,3,4]

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
  {Smaller, Larger} = partition(Pivot,Rest,[],[]),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
  if H =< Pivot -> partition(Pivot, T, [H | Smaller], Larger);
     H >  Pivot -> partition(Pivot, T, Smaller, [H, Larger])
  end.

%% list comprehension version
lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
  lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
  ++ [Pivot] ++
  lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).

