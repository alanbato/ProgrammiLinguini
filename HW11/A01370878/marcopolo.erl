-module(marcopolo).
-export([run/0, marcoYells/2, poloAnswers/2]).

marcoYells(X, Y) ->
  receive
    {Xd, Yd} -> io:format("Marco moves to (~p, ~p)~n", [X+Xd, Y+Yd]),
                polo ! {X+Xd, Y+Yd},
                marcoYells(X+Xd, Y+Yd)
  end.

poloAnswers(X, Y) ->
  receive
    {Xm, Ym} -> if
      ((X-Xm) == 0) and ((Y-Ym) == 0) -> io:format("Marco found me! I was hiding at position (~p, ~p)~n", [X, Y]);
      ((X-Xm) == 0) -> marco ! {0, (Y-Ym)/abs(Y-Ym)}, poloAnswers(X, Y);
      ((Y-Ym) == 0) -> marco ! {(X-Xm)/abs(X-Xm), 0}, poloAnswers(X, Y);
      true -> marco ! {(X-Xm)/abs(X-Xm), (Y-Ym)/abs(Y-Ym)}, poloAnswers(X, Y)
    end
  end.

run() ->
  Xm = rand:uniform(20),
  Ym = rand:uniform(20),
  io:format("Marco starts at position (~p, ~p)~n", [Xm, Ym]),
  register(marco, spawn(marcopolo, marcoYells, [Xm, Ym])),
  io:format("Polo is hidden...~n", []),
  register(polo, spawn(marcopolo, poloAnswers, [rand:uniform(20), rand:uniform(20)])),
  polo ! {Xm, Ym}.

