-module(fof).
-export([start/2, listen/1]).

listen(Color) -> 
  receive
    {PID, M} -> ;
    {PID, C, M} when C = Color -> io:format("Received a message from a friend process, ~p: '~p'.~n". [PID, M])

start(Id, Color) ->
  register(Id, spawn(fof, listen, [Color])).
