-module(appendNumber).
-export([start/0, listen/1]).

listen(X) -> 
	% Complete your code here.

start() ->
	register(appendNumber, spawn(appendNumber, listen, [[]])).
