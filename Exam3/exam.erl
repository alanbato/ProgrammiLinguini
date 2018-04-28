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
    if (A == AX) and (B == BX) and (C == CX) and (D == DX)
	 and (E == EX) ->
	   io:format("Congratulations: you have cracked the "
		     "pin.\n");
       true ->
	   receive
	     {Pid, a, X} when is_number(X), X >= 0, X =< 9 ->
		 if X < AX -> Pid ! -1;
		    X == AX -> Pid ! 0;
		    X > AX -> Pid ! 1
		 end,
		 pin(X, B, C, D, E);
	     {Pid, b, X} when is_number(X), X >= 0, X =< 9 ->
		 if X < BX -> Pid ! -1;
		    X == BX -> Pid ! 0;
		    X > BX -> Pid ! 1
		 end,
		 pin(A, X, C, D, E);
	     {Pid, c, X} when is_number(X), X >= 0, X =< 9 ->
		 if X < CX -> Pid ! -1;
		    X == CX -> Pid ! 0;
		    X > CX -> Pid ! 1
		 end,
		 pin(A, B, X, D, E);
	     {Pid, d, X} when is_number(X), X >= 0, X =< 9 ->
		 if X < DX -> Pid ! -1;
		    X == DX -> Pid ! 0;
		    X > DX -> Pid ! 1
		 end,
		 pin(A, B, C, X, E);
	     {Pid, e, X} when is_number(X), X >= 0, X =< 9 ->
		 if X < EX -> Pid ! -1;
		    X == EX -> Pid ! 0;
		    X > EX -> Pid ! 1
		 end,
		 pin(A, B, C, D, X);
	     cancel ->
		 io:format("You have failed to crack the pin.\n")
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
bankServer(D) ->
    receive
      {create, Acc, Amount} ->
	  io:format("Registered client~n"),
	  bankServer(orddict:store(Acc, Amount, D));
      {balance, Acc} ->
	  case orddict:is_key(Acc, D) of
	    true ->
		client ! {balance, orddict:find(Acc, D)}, bankServer(D);
	    false -> client ! {balance, error}, bankServer(D)
	  end;
      {deposit, Acc, Amount} ->
	  case orddict:is_key(Acc, D) of
	    true ->
		client ! {deposit, Amount},
		bankServer(orddict:update_counter(Acc, Amount, D));
	    false -> client ! {deposit, error}, bankServer(D)
	  end;
      {withdraw, Acc, Amount} ->
	  case orddict:is_key(Acc, D) of
	    true ->
		client ! {withdraw, Amount},
		bankServer(orddict:update_counter(Acc, -Amount, D));
	    false -> client ! {withdraw, error}, bankServer(D)
	  end;
      status ->
	  io:format("The status of the accounts are:~n~p~n",
		    [orddict:to_list(D)]),
	  bankServer(D);
      stop ->
	  self() ! status,
	  io:format("The bank is closing now. Bye!~n", [])
    end.

clientReceive() ->
    receive
      {balance, error} ->
	  io:format("The account doesn't exist.~n", []),
	  clientReceive();
      {balance, {ok, Amount}} ->
	  io:format("Your account balance is: $~p~n", [Amount]),
	  clientReceive();
      {deposit, error} ->
	  io:format("Your account doesn't exist.~n", []),
	  clientReceive();
      {deposit, Amount} ->
	  io:format("Your account has been deposited $~p.~n",
		    [Amount]),
	  clientReceive();
      {withdraw, error} ->
	  io:format("Your account cannot be credited that "
		    "amount.~n",
		    []),
	  clientReceive();
      {withdraw, Amount} ->
	  io:format("Your have withdrawn $~p from your account.~n",
		    [Amount]),
	  clientReceive()
    end.

startBank() ->
    io:format("The bank is opening. Welcome!~n", []),
    register(client, spawn(exam, clientReceive, [])),
    register(bank,
	     spawn(exam, bankServer, [orddict:new()])).

stopBank() -> bank ! stop.

createAccount(_, N) when N < 500 ->
    io:format("The minimum amount to open an account "
	      "is $500.~n",
	      []);
createAccount(A, N) when N >= 500 ->
    io:format("Your account has been created with $~p.~n",
	      [N]),
    bank ! {create, A, N}.

balance(A) -> bank ! {balance, A}.

deposit(_, N) when N < 20 ->
    io:format("The minimum amount to deposit is $20.~n",
	      []);
deposit(A, N) -> bank ! {deposit, A, N}.

withdraw(_, N) when N < 1 ->
    io:format("The minimum amount to withdraw is $1.~n",
	      []);
withdraw(A, N) -> bank ! {withdraw, A, N}.

statusBank() -> bank ! status.

%=======================================
% Bisection method
%=======================================
evaluate(L, X) ->
    lists:foldl(fun (C, Acc) -> X * Acc + C end, 0, L).

findRoot(L, A, B, E) ->
    C = (A + B) / 2,
    FA = evaluate(L, A),
    FB = evaluate(L, B),
    FC = evaluate(L, C),
    if FA * FB > 0 ->
	   io:format("The method needs points f(a) and f(b) "
		     "to have different signs.~n",
		     []);
       (E > abs(FC)) or (E > (B - A) / 2) ->
	   io:format("~p~n", [C]);
       FA * FC > 0 -> findRoot(L, C, B, E);
       true -> findRoot(L, A, C, E)
    end.

%=======================================
% Codes for game of lists
%=======================================

sum([], _) -> 0;
sum([X | Xs], true) -> X + sum(Xs, false);
sum([_ | Xs], false) -> sum(Xs, true).

% You can test your function against this dummy player. This funciton always selects the element on the left.
dummyPlayer() ->
    receive
      {Pid, L} ->
	  case hd(L) > lists:last(L) of
	    true -> Pid ! left, dummyPlayer();
	    false -> Pid ! right, dummyPlayer()
	  end
    end.

% Modify this function to play in a more "intelligent" way.
% At this moment it always selects right.
% Rememeber that you can provide additional arguments to your function in order to get a better performance.
player() ->
    receive {Pid, L} -> Pid ! best_choice(L), player() end.

best_value([], true, Acc1, _) -> Acc1;
best_value([], false, _, Acc2) -> Acc2;
best_value([N], true, Acc1, _) -> N + Acc1;
best_value([N], false, _, Acc2) -> Acc2 - N;
best_value(L, true, Acc1, Acc2) ->
    lists:max([best_value(L2, false, Acc1 + N, Acc2)
	       || {L2, N}
		      <- [{tl(L), hd(L)},
			  {lists:droplast(L), lists:last(L)}]]);
best_value(L, false, Acc1, Acc2) ->
    lists:min([best_value(L2, true, Acc1, Acc2 - N)
	       || {L2, N}
		      <- [{tl(L), hd(L)},
			  {lists:droplast(L), lists:last(L)}]]).

best_choice(L) ->
    Left = best_value(tl(L), false, hd(L), 0),
    Right = best_value(lists:droplast(L), false,
		       lists:last(L), 0),
    if Left > Right -> left;
       true -> right
    end.

% --------------------------------------------------
% This must not be changed.
% Modify only the lines that
startGame() ->
    X = [rand:uniform(20), rand:uniform(20),
	 rand:uniform(20), rand:uniform(20), rand:uniform(20),
	 rand:uniform(20), rand:uniform(20), rand:uniform(20),
	 rand:uniform(20), rand:uniform(20)],
    register(player1,
	     spawn(exam, player,
		   [])), % If you need extra parameters, use them here when you initialize your player.
    register(player2, spawn(exam, dummyPlayer, [])),
    io:format("~p\n", [X]),
    play(true, X, 0, 0).

play(_, [], SP1, SP2) ->
    exit(whereis(player1), ok),
    exit(whereis(player2), ok),
    io:format("Score for player 1: ~p.\n", [SP1]),
    io:format("Score for player 2: ~p.\n", [SP2]),
    if SP1 > SP2 -> io:format("\tPlayer 1 wins.\n");
       SP1 < SP2 -> io:format("\tPlayer 2 wins.\n");
       true -> io:format("\tIt is a tie.")
    end;
play(true, X, SP1, SP2) ->
    % Block for player 1
    player1 ! {self(), X},
    receive
      left ->
	  io:format("Player 1 chooses left: ~p\n", [hd(X)]),
	  play(false, tl(X), SP1 + hd(X), SP2);
      right ->
	  io:format("Player 1 chooses right: ~p\n",
		    [hd(lists:reverse(X))]),
	  play(false, lists:reverse(tl(lists:reverse(X))),
	       SP1 + hd(lists:reverse(X)), SP2)
    end;
play(false, X, SP1, SP2) ->
    % Block for player 2
    player2 ! {self(), X},
    receive
      left ->
	  io:format("Player 2 chooses left: ~p\n", [hd(X)]),
	  play(true, tl(X), SP1, SP2 + hd(X));
      right ->
	  io:format("Player 2 chooses right: ~p\n",
		    [hd(lists:reverse(X))]),
	  play(true, lists:reverse(tl(lists:reverse(X))), SP1,
	       SP2 + hd(lists:reverse(X)))
    end.

% --------------------------------------------------

%=======================================
% Codes for bin packing
%=======================================
findPlace(E, [], _, Rest) -> Rest ++ [[E]];
findPlace(E, [H | T], C, Rest) ->
    Sum = lists:sum(H) + E,
    if Sum =< C -> Rest ++ [[E] ++ H] ++ T;
       true -> findPlace(E, T, C, Rest ++ [H])
    end.

firstFit([], _, A) -> A;
firstFit([H | T], C, A) ->
    firstFit(T, C, findPlace(H, A, C, [])).

solve([H | T], C) -> firstFit(T, C, [[H]]).
