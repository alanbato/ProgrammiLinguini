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

% === travelTime ===

travelTime(Time) :- 
	A is 4,
	C is A - 1,
	B is C * 4,
	Time is B*2, !.

% === cellGames ===

before(X, Y, Solution) :- nth1(X1, Solution, X), nth1(Y1, Solution, Y),	X1 < Y1.

after(X, Y, Solution) :- before(Y, X, Solution).

cellGame(Solution) :- 
	length(Solution, 3),
	member(vegeta, Solution),
	member(gohan, Solution),
	member(goku, Solution),
	after(vegeta, gohan, Solution),
	before(goku, gohan, Solution), !.

	

% === ages ===

ages(J, L, F, Y) :- 
	between(12, 22, J),
	between(12, 22, L),
	between(12, 22, F),
	all_different([J, L, F]),
	J + L + F =:= 46,
	J + L + F + (Y*3) =:= 85, !.

% === gardeningContest ===

gardeningContest(Solution) :-
	length(Solution, 3),
	after([brooke,_], [_,vanity],Solution),
	after([brooke,_], [_,gold],Solution),
	member([virginia,vanity], Solution),
	member([tricia,gold], Solution),
	member([tricia,_], Solution),
	before([_,vanity], [_,quietness],Solution),
	before([_,gold], [_,quietness],Solution), !.

% === tournament ===

tournament(CA, A, T, R, C) :-  % [28,24,20,22,23]
	C > T,
	C > R,
	C < A,
	CA is 28,
	C is CA - 5,
	T is 20,
	CA - A is 2 * (R - T), !.



% === zebra ===

right(X, Y, L) :- append(_, [X, Y|_], L).
next(X, Y, L):- right(X, Y, L) ; right(Y, X, L).

zebra(Solution) :- 
	length(Solution, 5), 
    member([red,_,_,_,english], Solution),
    member([_,dog,_,_,spanish], Solution),
    member([green,_,coffe,_,_], Solution),
	member([_,_,tea,_,ukranian], Solution),
	next([green,_,_,_,_], [white,_,_,_,_], Solution),
	member([_,serpent,_,winston,_], Solution),
	member([yellow,_,_,kool,_], Solution),
	Solution = [_,_,[_,_,milk,_,_],_,_],
	Solution = [[_,_,_,_,norwegian],_,_,_,_],
	\+member([_,fox,_,chesterfield,_], Solution),
	\+member([_,horse,_,kool,_], Solution),
	member([_,_,juice,lucky,_], Solution),
	\+member([blue,_,_,_,norwegian], Solution),
    member([_,_,_,kent,japan], Solution), 
	member([_,zebra,_,_,_], Solution),
	member([_,_,water,_,_], Solution),!.

start :-
	write("% === travelTime ==="), nl, 
	travelTime(Time), % 24
	write(Time), nl,
	write("% === cellGames ==="), nl, 
	cellGame(Order), % [goku,gohan,vegeta]
	write(Order), nl,
	write("% === ages ==="), nl, 
	ages(J, L, F, Y), % [14,17,15,13]
	Names = [J, L, F, Y], 
	write(Names), nl,
	write("% === gardeningContest ==="), nl, 
	gardeningContest(Results),
	write(Results), nl,
	write("% === tournament ==="), nl, 
	tournament(CruzAzul, America, Tigres, Rayados, Chivas), % [28,24,20,22,23]
	Teams = [CruzAzul, America, Tigres, Rayados, Chivas],
	write(Teams), nl,
	write("% === zebra ==="), nl, % [[norwegian,fox,kool,water,yellow],[ukrainian,horse,chesterfield,tea,blue],[english,snake,winston,milk,red],[japonese,zebra,kent,coffee,green],[spanish,dog,lucky,juice,white]]
	zebra(Solution),
	write(Solution), nl, !.