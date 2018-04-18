-module(calc).
-export([startCalculator/1, operation/1, add/1, multiply/1, subtract/1, divide/1, getresult/0]).

operation(N) ->
  receive
    "Result" -> io:format("The result is ~p.~n", [N]), operation(N);
    {"+", A} -> operation(N + A);
    {"-", A} -> operation(N - A);
    {"/", A} -> operation(N / A);
    {"*", A} -> operation(N * A);
    _ -> io:format("I do not recognize that operation.~n", []), operation(N)
  end.

add(N) -> whereis(calculator) ! {"+", N}.
subtract(N) -> whereis(calculator) ! {"-", N}.
multiply(N) -> whereis(calculator) ! {"*", N}.
divide(N) -> whereis(calculator) ! {"/", N}.
getresult() -> whereis(calculator) ! "Result".

startCalculator(N) -> 
  Pid = spawn(calc, operation, [N]),
  register(calculator, Pid).
