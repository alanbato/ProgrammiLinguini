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

% === cryptarithmetic ===

% AB
% TWO
% TWO
%----
%FOUR
cryptarithmetic(T, W, O, F, U, R) :- 
	between(0, 9, T),
	between(0, 9, W),
	between(0, 9, O),
	between(0, 1, F),
	between(0, 9, U),
	between(0, 9, R),
	between(0, 1, A), %Los carrys van en A y B
	between(0, 1, B),
	R is (2 * O) mod 10, % r es el mod 10 de 2 veces O
	B is (2 * O) div 10, % b es lo que sobra
	U is ((2 * W) + B) mod 10, % u es el mod 10 de 2 veces W + el carry de la pasada
	A is ((2 * W) + B) div 10,
	O is ((2* T) + A) mod 10,
	O is ((2* T) + A) div 10,
	all_different([T, W, O, F, U, R]).
	
% === oldest ===

before(X, Y, L) :- nth1(X1, L, X), nth1(Y1, L, Y), X1 < Y1.
after(X, Y, L) :- before(Y, X, L).

oldest(Solution) :-
    length(Solution, 5),
    member(julio, Solution),
    member(gloria, Solution),
    member(miguel, Solution),
	member(silvia, Solution),
	member(pablo, Solution),
	before(julio, gloria, Solution),
	before(julio, pablo, Solution),
	after(miguel, silvia, Solution),
	after(miguel, pablo, Solution),
	before(miguel, gloria, Solution),
	after(julio, silvia, Solution), !.

% === farthest ===

farthest(Solution) :- 
	length(Solution, 4),
	member(mova, Solution),
	member(taci, Solution),
	member(dape, Solution),
	member(liru, Solution),
	before(taci, mova, Solution),
	before(dape, liru, Solution),
	before(liru, taci, Solution), !.

% === familyIssues ===

next(X, Y, L) :- (nth1(1, L, X), length(L, Yi), nth1(Yi, L, Y), !); (nth1(1, L, Y), length(L, Xi), nth1(Xi, L, X), !).
next(X, Y, L) :- nth1(Xi, L, X), nth1(Yi, L, Y), (Xi is Yi - 1; Xi is Yi + 1), !.

familyIssues(Solution) :- 
	length(Solution, 7),
	member(ben, Solution),
	member(rey, Solution),
	member(luke, Solution),
	member(leia, Solution),
	member(han, Solution),
	member(palpatine, Solution),
	member(anakin, Solution),
	next(ben, rey, Solution),
	\+next(ben, luke, Solution),
	next(luke, leia, Soltuion),
	next(luke, han, Solution),
	\+next(luje, palpatine, Solution),
	next(palpatine, anakin, Solution),
	\+next(palpatine, leia, Solution),
	next(anakin, ben, Solution), !.


% === eightTowers ===

eightTowers(X1, X2, X3, X4, X5, X6, X7, X8) :- 
	length(Solution, 8),
	member(X1, Solution),
	member(X2, Solution),
	member(X3, Solution),
	member(X4, Solution),
	member(X5, Solution),
	member(X6, Solution),
	member(X7, Solution),
	member(X8, Solution), !.

start :-
	write("% === cryptarithmetic ==="), nl, 
	cryptarithmetic(T, W, O, F, U, R), % [1,3,2,0,6,4]
	Solution = [T, W, O, F, U, R],
	write(Solution), nl,
	write("% === oldest ==="), nl, 
	oldest(Ages), % [silvia,julio,pablo,miguel,gloria]
	write(Ages), nl,
	write("% === farthest ==="), nl, 
	farthest(Distance), % [dape,liru,taci,mova]
	write(Distance), nl,
	write("% === familyIssues ==="), nl, 
	familyIssues(Family), % [ben,rey,leia,luke,han,palpatine,anakin]
	write(Family), nl, 
	write("% === eightTowers ==="), nl, 
	eightTowers(X1, X2, X3, X4, X5, X6, X7, X8), %
	Board = [X1, X2, X3, X4, X5, X6, X7, X8],
	write(Board), nl, !.