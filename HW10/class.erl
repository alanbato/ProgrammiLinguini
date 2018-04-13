-module(class).
-export([removeFirst/2, sumAllElements/1, matrix/1, quicksort/1, getDegrees/1, summary/1]).

removeFirst(0, L) -> L;
removeFirst(N, [_ | T]) -> removeFirst(N - 1, T).

sumAllElements([]) -> 0;
sumAllElements([H | T]) when is_list(H) -> sumAllElements(T);
sumAllElements([H | T]) -> sumAllElements(T) + H.

matrix([[] | _]) -> [];
matrix(M) -> [lists:map(fun(X) -> hd(X) end, M) | (matrix(lists:map(fun(X) -> tl(X) end, M)))].

quicksort([]) -> [];
quicksort([H | L]) -> quicksort(lists:filter(fun(X) -> X < H end, L)) ++ [H | quicksort(lists:filter(fun(X) -> X > H end, L))].

getDegrees([]) -> [];
getDegrees(L) -> lists:map(fun(X) -> length(X) - 1 end, L).

fst({X, _}) -> X.
snd({_, Y}) -> Y.
meanHeight(T) -> [{fst(hd(T)), lists:sum(lists:map(fun(X) -> snd(X) end, T)) / length(T)}].
summary(T) -> meanHeight(lists:filter(fun({X, Y}) -> X == "Male" end, T)) ++ meanHeight(lists:filter(fun({X, Y}) -> X == "Female" end, T)).