-module(listCount).
-export([start/1, sum/0, sumList/1, master/0]).

sumList(L) -> lists:sum(L).

sum() ->
  receive
   L -> requester ! {"Finished", sumList(L)}
  end.

master() ->
  receive
    {"Start", L} -> summer ! L, master();
    {"Finished", R} -> io:format("Result: ~p~n", [R]), master()
  end.

start(L) ->
  Pid1 = spawn(listCount, master, []),
  Pid2 = spawn(listCount, sum, []),
  register(requester, Pid1),
  register(summer, Pid2),
  requester ! {"Start", L}.
