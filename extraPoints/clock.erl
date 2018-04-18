-module(clock).
-export([tic/1, tac/1, startClock/0, stop/0]).

stop() -> ticclock ! "Stop", tacclock ! "Stop".

tic(Time) ->
  receive
    "Tac" -> io:format("Tic...~n"), tacclock ! "Tic";
    "Stop" -> exit(whereis(ticclock), normal)
  after Time -> tic(Time)
  end.

tac(Time) ->
  receive
    "Tic" -> io:format("Tac...~n"), ticclock ! "Tac";
    "Stop" -> exit(whereis(tacclock), normal)
  after Time -> tac(Time)
  end.

startClock() ->
  io:format("Clock started~n"),
  Pid1 = spawn(clock, tic, [1000]),
  register(ticclock, Pid1),
  Pid2 = spawn(clock, tac, [1000]),
  register(tacclock, Pid2),
  ticclock ! "Tac".
