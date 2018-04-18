-module(calculator).
-export([start/3, sum/0, multiply/0]).

multiply() ->
  receive
    {Y, Z} -> io:format("Result: ~p~n", [Y * Z])
  end.

sum() ->
  receive
   {X, Y, Z} -> op2 ! {X, Y + Z}
  end.

start(X, Y, Z) ->
  Pid1 = spawn(calculator, sum, []),
  Pid2 = spawn(calculator, multiply, []),
  register(op2, Pid2),
  Pid1 ! {X, Y, Z}.
