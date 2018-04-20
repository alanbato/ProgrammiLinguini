-module(calculator).
-export([start/1, listen/1]).

listen(0) -> io:format("No more operations are allowed.~n", []);
listen(N) -> 
  receive
    {"+", A, B} -> 
      io:format("The sum of the numbers is: ~p.~n", [A+B]),
      operation(N - 1);
    {"-", A, B} -> 
      io:format("The subtraction of the numbers is: ~p.~n", [A-B]),
      operation(N - 1);
    {"/", A, B} -> 
      io:format("The division of the numbers is: ~p.~n", [A/B]),
      operation(N - 1);
    {"*", A, B} -> 
      io:format("The multiplication of the numbers is: ~p.~n", [A*B]),
      operation(N - 1);
    _ -> io:format("I do not recognize that operation.~n", [])
  end.

start(N) ->
	io:format("Calculator started...~n"),
	register(calculator, spawn(calculator, listen, [N])).
