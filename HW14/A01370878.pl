insertionSort([], []) :- !.
insertionSort([X|L], S) :-
    insertionSort(L, S1),
    insert(X, S1, S).

insert(X, [], [X]) :- !.
insert(X, [X1|L1], [X, X1|L1]) :-
    X=<X1, !.
insert(X, [X1|L1], [X1|L]) :-
    insert(X, L1, L).

travelTime(A, B, C) :-
    A is 4,
    C is A-1,
    B is 4*C,
    Res is B*2,
    write('It takes '),
    write(Res),
    write(' hours to go and return fromB').

before(X, Y, Solution) :-
    nth1(X1, Solution, X),
    nth1(Y1, Solution, Y),
    X1<Y1.

fightingCell(Solution) :-
    length(Solution, 3),
    member(goku, Solution),
    member(vegeta, Solution),
    member(gohan, Solution),
    before(goku, gohan, Solution),
    before(gohan, vegeta, Solution), !.
