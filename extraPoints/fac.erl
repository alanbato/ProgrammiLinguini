-module(fac).
-export([fact/2, worker/3, manager/1, main/0]).

fact(N, Start) -> lists:foldl(fun(L, R) -> L*R end, 1, lists:seq(Start, N)).

worker({Start, End}, I, Pid) ->
  R = fact(End, Start),
  Pid ! {finished, I, R}.

manager(Queue) ->
  receive
  	{finished, I, Result} ->
  	  if length(Queue) == 0 -> manager([Result]);
  	  	 true ->
  	  	   R = hd(Queue) * Result,
  	  	   io:format("~p~n", [R])
  	  end
  end.


main() ->
  N = 10,
  {M1, M2} = {{1, N div 2}, {N div 2 + 1, N}},
  M = spawn(fac, manager, [[]]),
  spawn(fac, worker, [M1, 1, M]),
  spawn(fac, worker, [M2, 2, M]).
