-module(appendNumber).
-export([start/0, listen/1]).

listen(L) -> 
	receive
        X -> if
            is_integer(X), X >= 0 -> io:format("Number ~p has been added to the list.~n", [X]),
                                     listen(lists:append([X], L));
            true -> io:format("The numbers registered by the process are: ~p.~n", [L])
        end
    end.

start() ->
	register(appendNumber, spawn(appendNumber, listen, [[]])).
