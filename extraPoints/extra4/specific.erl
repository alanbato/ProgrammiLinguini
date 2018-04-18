-module(specific).
-export([respond/0, start/0]).

respond() ->
  receive
    X when is_integer(X) -> io:format("Number received plus one: ~p~n", [X+1]), respond();
    X ->  io:format("Number not received, terminating...~n")
  end.

start() ->
  Pid1 = spawn(specific, respond, []),
  register(p1, Pid1).
