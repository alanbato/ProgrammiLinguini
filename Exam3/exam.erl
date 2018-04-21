-module(exam).
-compile(export_all).

%=======================================
% Do not forget to include the full name 
% and student ID of the team members
%=======================================

% Name: Enrique Barragán González
% Student ID: A01370878

% Name: Alan Fernando Velasco Astorga
% Student ID: A01113373

%=======================================
% Codes for the PIN Cracker
%=======================================

pin(A, B, C, D, E) ->
  AX = 3,
  BX = 8,
  CX = 5,
  DX = 9,
  EX = 2,
  if (A == AX) and (B == BX) and (C == CX) and (D == DX) and (E == EX) ->
    io:format("Congratulations: you have cracked the pin.\n");
    true ->
      receive
        {Pid, a, X} when is_number(X), X >= 0, X =< 9 ->
          if
            X < AX -> Pid ! -1;
            X == AX -> Pid ! 0;
            X > AX -> Pid ! 1
          end,
          pin(X, B, C, D, E);
        {Pid, b, X} when is_number(X), X >= 0, X =< 9 ->
          if
            X < BX -> Pid ! -1;
            X == BX -> Pid ! 0;
            X > BX -> Pid ! 1
          end,
          pin(A, X, C, D, E);
        {Pid, c, X} when is_number(X), X >= 0, X =< 9 ->
          if
            X < CX -> Pid ! -1;
            X == CX -> Pid ! 0;
            X > CX -> Pid ! 1
          end,
          pin(A, B, X, D, E);
        {Pid, d, X} when is_number(X), X >= 0, X =< 9 ->
          if
            X < DX -> Pid ! -1;
            X == DX -> Pid ! 0;
            X > DX -> Pid ! 1
          end,
          pin(A, B, C, X, E);
        {Pid, e, X} when is_number(X), X >= 0, X =< 9 ->
          if
            X < EX -> Pid ! -1;
            X == EX -> Pid ! 0;
            X > EX -> Pid ! 1
          end,
          pin(A, B, C, D, X);
        cancel -> io:format("You have failed to crack the pin.\n")
      end
  end.

pinCracker(Pid, Letter, Value) ->
  Pid ! {self(), Letter, Value},
  receive
    -1 -> pinCracker(Pid, Letter, Value + 1);
    0 -> io:format("Correct digit: ~p.\n", [Value]);
    1 -> pinCracker(Pid, Letter, Value - 1)
  end.

startCracker() ->
	Pin = spawn(exam, pin, [-1, -1, -1, -1, -1]),
	spawn(exam, pinCracker, [Pin, a, 5]),
	spawn(exam, pinCracker, [Pin, b, 5]),
	spawn(exam, pinCracker, [Pin, c, 5]),
	spawn(exam, pinCracker, [Pin, d, 5]),
	spawn(exam, pinCracker, [Pin, e, 5]).


%=======================================
% Codes for the Bank-like system
%=======================================

% start() -> .
% stop() -> .
% print_balances() ->.
% create_account(A) ->.
% print_balance(U) ->.

%=======================================
% Codes for the factorial
%=======================================



%=======================================
% Bisection method
%=======================================



%=======================================
% Codes for game of lists
%=======================================

sum([], _) -> 0;
sum([X | Xs], true) -> X + sum(Xs, false);
sum([_ | Xs], false) -> sum(Xs, true).

% You can test your function against this dummy player. This funciton always selects the element on the left.
dummyPlayer() ->
  receive
    {Pid, _} -> Pid ! left, dummyPlayer()
  end.

% Modify this function to play in a more "intelligent" way.
% At this moment it always selects right.
% Rememeber that you can provide additional arguments to your function in order to get a better performance.
player() ->
receive
    {Pid, _} -> Pid ! right, player()
  end.

% --------------------------------------------------
% This must not be changed.
% Modify only the lines that
startGame() ->
  X = [rand:uniform(20), rand:uniform(20), rand:uniform(20), rand:uniform(20), rand:uniform(20),
    rand:uniform(20), rand:uniform(20), rand:uniform(20), rand:uniform(20), rand:uniform(20)],
  register(player1, spawn(exam, player, [])), % If you need extra parameters, use them here when you initialize your player.
  register(player2, spawn(exam, dummyPlayer, [])),
  io:format("~p\n", [X]),
  play(true, X, 0, 0).

play(_, [], SP1, SP2)->
  exit(whereis(player1), ok),
  exit(whereis(player2), ok),
  io:format("Score for player 1: ~p.\n", [SP1]),
  io:format("Score for player 2: ~p.\n", [SP2]),
  if
    SP1 > SP2 -> io:format("\tPlayer 1 wins.\n");
    SP1 < SP2 -> io:format("\tPlayer 2 wins.\n");
    true -> io:format("\tIt is a tie.")
  end;
play(true, X, SP1, SP2) ->
  % Block for player 1
  player1 ! {self(), X},
  receive
    left -> io:format("Player 1 chooses left: ~p\n", [hd(X)]), play(false, tl(X), SP1 + hd(X), SP2);
    right -> io:format("Player 1 chooses right: ~p\n", [hd(lists:reverse(X))]), play(false, lists:reverse(tl(lists:reverse(X))), SP1 + hd(lists:reverse(X)), SP2)
  end;
play(false, X, SP1, SP2) ->
  % Block for player 2
  player2 ! {self(), X},
  receive
    left -> io:format("Player 2 chooses left: ~p\n", [hd(X)]), play(true, tl(X), SP1, SP2 + hd(X));
    right -> io:format("Player 2 chooses right: ~p\n", [hd(lists:reverse(X))]), play(true, lists:reverse(tl(lists:reverse(X))), SP1, SP2 + hd(lists:reverse(X)))
  end.
% --------------------------------------------------

%=======================================
% Codes for bin packing
%=======================================

