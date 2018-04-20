-module(fof).
-export([start/2, msg/2]).

msg(P, C) ->
  receive
    {Process, Message} -> Process ! {"Color", C, Message}, msg(P, C);
    {"Color", Color, Message} when Color == C -> io:format("Received a message from a friend process, ~p: '~p'.~n", [self(), Message]), msg(P, C);
    _ -> io:format("Process ~p is not my friend. I will ignore its message.~n", [self()]), msg(P, C)
  end.

start(P, C) ->
  register(P, spawn(fof, msg, [P, C])).
