-module(recursion).
-import(lists, [reverse/1]).
-export([fac/1, len/1, tail_fac/1, duplicate/2,
         tail_duplicate/2, tail_reverse/1,
         sublist/2, tail_sublist/2]).

fac(N) when N == 0 -> 1;
fac(N) when N > 0 -> N * fac(N-1).

len([]) -> 0;
len([_|T]) -> 1 + len(T).

tail_fac(N) -> tail_fac(N,1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 ->  tail_fac(N-1, Acc*N).

duplicate(0, _) -> [];
duplicate(Num, Term) -> [Term | duplicate(Num-1, Term)].

tail_duplicate(Num, Term) -> tail_duplicate(Num, Term, []).

tail_duplicate(0, _, Result) -> Result;
tail_duplicate(Num, Term, List) -> tail_duplicate(Num-1, Term, [Term|List]).

%% reverse([]) -> [];
%% reverse([H|T]) -> reverse(T) ++ H.

tail_reverse(List) -> tail_reverse(List, []).

tail_reverse([], Agg) -> Agg;
tail_reverse([H|T], Agg) -> tail_reverse(T, [H|Agg]).

sublist(N, List) -> sublist(N, [], List).

sublist(0, Sub, _) -> Sub;
sublist(_, [], []) -> [];
sublist(N, Sub, [H|T]) when N > 0 -> [H|sublist(N-1, Sub, T)].

tail_sublist(N, List) -> tail_sublist(N, [], List).
tail_sublist(0, Sub, _) -> reverse(Sub);
tail_sublist(N, Sub, [H|T]) -> tail_sublist(N-1, [H|Sub], T).

