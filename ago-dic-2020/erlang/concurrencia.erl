-module(concurrencia).
-export([speak/2, run/0]).

%concurrencia: que las cosas pasan paralelamente

%para trabajar con concurrencia:
%spawn used to create processes
%send used to send messages
%recieve used to receive messages

%Pid = spawn(Module, Function, Arguments). %los argumentos van como lista
%regresa un PID para keep track
%el resultado de una función se pierde, si la llamas desde spawn
speak(_, 0) -> done; %no vas a ver el done en la pantalla pq pierdes el resultado
speak(What, N) ->
	io:format("~p~n", [What]),
	speak(What, N-1).

% Pid ! Message.
%asi mandas un mensaje a un proceso, es asíncrono, el mensaje es cualquier cosa válida en erlang
% Pid1 ! Pid2 ! Pid3! Message
% asi le mandas el mensaje a varios procesos
%erlang no te marca errores aunque si tengas

%MessageN [when GuardN] -> ActionsN;
area() ->
	receive 
		{rectangle, H, W} -> 
			io:format("Area of rect: ~p~n", [H*W]),
			area();
		{circle, R} -> 
			io:format("Area of rect: ~p~n", [R*R*3.1416]),
			area();
		_ ->
			io:format("I don't know the shape"),
			area() %aqui no trae ; pq ya se acabó
	end.

delayedPrint(Time, Text) -> %tiempo viene en milisegundos
	receive %comno no le pones nada en el receive, entrará al after dsps del tiempo que le digas
	after
		Time -> io:format("~p~n", [Text])
	end.

selective() -> %asi aseguras que van en orden
	receive
		first ->
			io:format("llego first. ~n")
	end,
	receive
		second ->
			io:format("llego second. ~n")
	end.

% process registration
%register(Alias, Pid)
%unregister(Alias)
%whereis(Alias) te regresa el pid, dq <###>
%registered() te regresa todos los alias del sistema

run() -> 
	%al correr esto imprime tmb un pid
	spawn(concurrencia, speak, [hello,3]),
	spawn(concurrencia, speak, [bye, 3]).
	%esto es en terminal, asi lo llamas
	%Pid = spawn(fun concurrencia:area/0).
	%Pid ! {rectangle, 8, 4}.