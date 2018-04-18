-module(fof).
-export([start/2, msg/2]).

msg(P, C) ->
  receive
    {Process, Message} -> io:format("Received a message from a friend process, ~p: '~p'.~n", [Process, Message])
  end.

start(P, C) ->
  spawn(fof, msg, [P, C]).
