-module(guess).
-export([start/1, connect/1, server/1, clientReceive/0, clientSend/1]).

server(N) -> 
	% Complete your code here.
	% This is the code for the server.
  receive
    {X, Node} when X < N -> {client, Node} ! smaller, server(N);
    {X, Node} when X > N -> {client, Node} ! larger, server(N);
    {_, Node} -> {client, Node} ! equal, server(N);
  end.

clientReceive() ->
	% Complete your code here.
	% This is the code for the client to handle the messages sent by the server (the feedback on the guess).
  receive
    smaller -> io:format("Your guess is smaller than the secret number~n"), clientReceive();
    larger -> io:format("Your guess is larger than the secret number~n"), clientReceive();
    equal -> io:format("Your guess is correct!~n"), clientReceive()
  end.

clientSend(Node) ->
	% Complete your code here.
	% This is the code for the client to send messages to the server.
	% You can use {server, Node} ! {N} to send a guess to the server.
	% Do not forget to include node() when sendind a message to the server, otherwise the server will not know in which node your process is running.
  receive
    N -> {server, Node} ! {N, node()}, clientSend(Node)
  end.

% Starts the session in the server
start(N) -> 
	register(server, spawn(guess, server, [N])).

% Starts the session in the client.
% The names of the process are already defined for your convenience.
connect(Node) -> 
	register(client, spawn(guess, clientReceive, [])),
	register(play, spawn(guess, clientSend, [Node])).
