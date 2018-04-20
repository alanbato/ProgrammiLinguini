-module(guess).
-export([start/1, connect/1, server/1, clientReceive/0, clientSend/1]).

server(N) -> 
  % Complete your code here.
  % This is the code for the server.
  receive
    {Guess, Node} -> if
      Guess == N -> io:format("Player tried ~p.~n", [Guess]),
                    {client, Node} ! {true, "Your guess is correct!"};
      Guess < N -> io:format("Player tried ~p.~n", [Guess]),
                   {client, Node} ! {false, "Your guess is smaller than the secret number."}, 
                   server(N);
      true -> io:format("Player tried ~p.~n", [Guess]),
              {client, Node} ! {false, "Your guess is larger than the secret number."},
              server(N)
    end
  end.

clientReceive() ->
  % Complete your code here.
  % This is the code for the client to handle the messages sent by the server (the feedback on the guess).
  receive
    {true, M} -> io:format("~p~n", [M]);
    {false, M} -> io:format("~p~n", [M]), clientReceive()
  end.

clientSend(Node) ->
  % Complete your code here.
  % This is the code for the client to send messages to the server.
  % You can use {server, Node} ! {N} to send a guess to the server.
  % Do not forget to include node() when sendind a message to the server, otherwise the server will not know in which node your process is running.
  receive
    {N} when is_integer(N) -> {server, Node} ! {N, node()}, clientSend(Node);
    _ -> io:format("That is not a proper guess~n", []), clientSend(Node)
  end.
% Starts the session in the server
start(N) -> 
  register(server, spawn(guess, server, [N])).

% Starts the session in the client.
% The names of the process are already defined for your convenience.
connect(Node) -> 
  register(client, spawn(guess, clientReceive, [])),
  register(play, spawn(guess, clientSend, [Node])).
