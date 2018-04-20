-module(fof).
-export([start/2, listen/1]).

listen(Color) -> 
	% Complete your code here.

start(Id, Color) ->
	register(Id, spawn(fof, listen, [Color])).
