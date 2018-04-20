-module(appendNumber).
-export([start/0, listen/1]).

listen(L) -> 
  receive
    X when is_integer(X), X >= 0 -> io:format("Number ~p has been added to the list.~n", [X]), append(lists:append(L, [X]));
    _ -> io:format("The numbers registered by the process are: ~p.~n", [L])
  end.

start() ->
	register(appendNumber, spawn(appendNumber, listen, [[]])).
 