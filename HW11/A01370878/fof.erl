-module(fof).
-export([start/2, listen/1]).

listen(C) -> 
  receive
    {Process, Message} -> Process ! {"Color", C, Message}, listen(self(), C);
    {"Color", Color, Message} when Color == C -> io:format("Received a message from a friend process, ~p: '~p'.~n", [self(), Message]), listen(self(), C);
    _ -> io:format("Process ~p is not my friend. I will ignore its message.~n", [self()]), listen(self(), C)
  end.

start(Id, Color) ->
	register(Id, spawn(fof, listen, [Color])).
