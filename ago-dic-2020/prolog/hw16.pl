% Roberta González A01570010
% ====================
% Complete the following programs and submit your file to Canvas.
% ====================
% Do not change the names of the programs. 
% Do not change the number of elements in the clauses.
% If your file cannot be loaded by the Prolog interpreter, your submission may be cancelled. 
% Then, submit only code that works.
% ====================
% Grading instructions:
% There is a series of test cases for each program. In order to state that your program
% "works as described", your output must be similar to the expected one in each case.

:- use_module(library(bounds)).

% === duplicate ===
duplicate([], []). 
duplicate([H|T], X) :- duplicate(T, Tres), append([H, H], Tres, X).

% === sum ===

sum([], 0).
sum([H|T], R) :- is_list(H), sum(T, Res), R is Res, !.
sum([H|T], R) :- sum(T, Res), R is Res + H, !.

% === toBinaryString ===
toBinaryString(0, 0).
toBinaryString(1, 1).
toBinaryString(N, X) :- NewN is N div 2, Rem is N mod 2, Rem is 0, toBinaryString(NewN, XRes), atomic_concat(XRes, 0, X), !.
toBinaryString(N, X) :- NewN is N div 2, toBinaryString(NewN, XRes), atomic_concat(XRes, 1, X), !.

% === isort ===
isort([], []).
isort([F|R], X):- isort(R,XRes), isortAux(F,XRes,X).

isortAux(X, [], [X]).
isortAux(X, [H|T], [X, H|T]):- X=<H, !.
isortAux(X, [H|T], [H|T2]):- isortAux(X, T, T2).
% === magicSquare ===

% |-------|
% | A B C |
% | D E F |
% | G H I |
% |-------|

magicSquare([A, B, C, D, E, F, G, H, I]) :- 
    %permutation hace lo de meter todos en una L y checa que no se repitan
	permutation([1,2,3,4,5,6,7,8,9], [A, B, C, D, E, F, G, H, I]),
	A + B + C =:= 15,
	D + E + F =:= 15,
	G + H + I =:= 15,
	A + D + G =:= 15,
	B + E + H =:= 15,
	C + F + I =:= 15,
	A + E + I =:= 15,
	G + E + C =:= 15, !.


% === path ===

edge(a, c, 5).
edge(c, b, 6).
edge(c, d, 8).
edge(b, e, 8).
edge(d, e, 2).
edge(e, f, 3).
edge(e, g, 7).
edge(f, g, 1).

%path(Inicio, Fin, ResCamino, ResCosto) :-

start :-
	write("% === duplicate ==="), nl, 
	duplicate([], X1), % []
	write(X1), nl,
	duplicate([1, 2, 3], X2), % [1,1,2,2,3,3]
	write(X2), nl,
	duplicate(X3, [a, a, b, b]), % [a,b]
	write(X3), nl,
	write("% === sum ==="), nl, 
	sum([], X4), % 0
	write(X4), nl,
	sum([1, 2, 3, 4, 5, 6], X5), % 21
	write(X5), nl,
	sum([1, [2, 3], [4, 5, 6], 7], X6), % 8
	write(X6), nl,
	write("% === toBinaryString ==="), nl, 
	toBinaryString(0, X7), % 0
	write(X7), nl,
	toBinaryString(1, X8), % 1
	write(X8), nl,
	toBinaryString(32, X9), % 100000
	write(X9), nl,
	toBinaryString(572, X10), % 1000111100
	write(X10), nl,
	write("% === isort ==="), nl, 
	isort([1, -1, 2, 10, 3], X11), % [-1,1,2,3,10]
	write(X11), nl, 
	write("% === magicSquare ==="), nl, 
	magicSquare(X12), % Many answers, check the constraints. 
	write(X12), nl,
	write("% === path ==="), nl, !.
	%path(a, e, PathAE, CostAE), % [a,c,b,e], 19
	%write(PathAE), write(", "), write(CostAE), nl,
	%path(d, g, PathDG, CostDG), % [d,e,g], 9
	%write(PathDG), write(", "), write(CostDG), nl, !.