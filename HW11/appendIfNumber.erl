-module(appendIfNumber).
-export([start/0, append/1]).

append(L) ->
  receive
    X -> if 
      is_integer(X), X >= 0 -> io:format("Number ~p has been added to the list.~n", [X]),
               append(lists:append(L, [X]));
      true -> io:format("The numbers registered by the process are: ~p.~n", [L])
      end
  end.

start() -> spawn(appendIfNumber, append, [[]]).
