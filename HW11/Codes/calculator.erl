-module(calculator).
-export([start/1, listen/1]).

listen(N) -> 
	% Complete your code here.
	% Do not forget to verify the number of allowed operations.

start(N) ->
	io:format("Calculator started...~n"),
	register(calculator, spawn(calculator, listen, [N])).
