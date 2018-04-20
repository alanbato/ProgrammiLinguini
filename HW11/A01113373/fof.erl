-module(fof).
-export([start/2, listen/1]).

listen(Color) -> 
  receive
    {PName, M} -> PName ! {self(), identify, M},
                  listen(Color);
    {PID, identify, M} -> PID ! {self(), Color, M},
                listen(Color);
    {PID, C, M} when C == Color -> io:format("Received a message from a friend process, ~p: '~p'.~n", [PID, M]),
                                  listen(Color);
    {PID, C, M} when C /= Color -> io:format("Process ~p is not my friend. I will ignore its message.~n", [PID]),
                                  listen(Color)
  end.

start(Id, Color) ->
  register(Id, spawn(fof, listen, [Color])).
