duplicate([], []).
duplicate([H|T], X) :- duplicate(T, Z), append([H,H], Z, X).

sum([], 0).
sum([H|T], X) :- is_list(H), sum(T, Z), X is Z.
sum([H|T], X) :- sum(T, Z), X is H + Z.

toBinaryString(0, '0').
toBinaryString(1, '1').
toBinaryString(N, X) :- 0 is N mod 2, Y is N / 2, toBinaryString(Y, Z), string_concat(Z, '0', X).
toBinaryString(N, X) :- 1 is N mod 2, Y is (N-1) / 2, toBinaryString(Y, Z), string_concat(Z, '1', X).

% Graph
% Nodes = [[1,2], [2,3], [2,5], [5,6]]
% findPath(Nodes, 1, 6, Result).
% Result = [1,2,5,6].

getPaths([[F,S]|_], F, S).
getPaths([[F,_]|T], F, X) :- getPaths(T, F, X).

printPs(G, F):- getPaths(G, F, X), write(X).

findPath([[X,Y], [Y,Z]], X, Z, [X,Y,Z]).
% findPath(G, Start, End, Result) :- W is getPath().
% findPath(G, F, T, X).

% Einstein Puzzle
% Norwegian drinks water
% No one has a zebra
right_of(X, Y) :- X is Y+1.
left_of(X, Y) :- right_of(Y, X).

next_to(X, Y) :- right_of(X, Y).
next_to(X, Y) :- left_of(X, Y).

einstein(Street, FishOwner) :-
    Street = [
           house(1, _, _, _, _, _),
           house(2, _, _, _, _, _),
           house(3, _, _, _, _, _),
           house(4, _, _, _, _, _),
           house(5, _, _, _, _, _)],
    member(house(_, brit, red, _, _, _), Street),
    member(house(_, swede, _, dog, _, _), Street),
    member(house(_, dane, _, _, tea, _), Street),
    member(house(A, _, green, _, _, _), Street),
    member(house(B, _, white, _, _, _), Street),
    left_of(A, B),
    member(house(_, _, green, _, coffee, _), Street),
    member(house(_, _, _, birds, _, pall_mall), Street),
    member(house(_, _, yellow,_, _, dunhill), Street),
    member(house(3, _, _,  _, milk, _), Street),
    member(house(1, norweigan,_,  _, _,  _   ), Street),
    member(house(C, _, _,  _, _,  blend  ), Street),
    member(house(D, _, _, cats, _, _), Street),
    next_to(C, D),
    member(house(E, _, _, horse, _, _), Street),
    member(house(F, _, _,  _, _,  dunhill), Street),
    next_to(E, F),
    member(house(_, _, _,  _, bluemaster, beer), Street),
    member(house(_, german, _,  _, _,  prince ), Street),
    member(house(G, norweigan,_,  _, _, _), Street),
    member(house(H, _, blue, _, _, _), Street),
    next_to(G, H),
    member(house(I, _, _,  _, _, blend), Street),
    member(house(J, _, _,  _, water, _), Street),
    next_to(I, J),
    member(house(_, FishOwner, _, fish, _, _), Street).
  

hanoi(N) :- move(N, left, center, right).
 
move(0, _, _, _) :- !.
move(N,A,B,C) :-
    M is N-1,
    move(M,A,C,B),
    printstatus(A,B),
    move(M,C,B,A).
 
printstatus(X,Y) :- 
  write('Move a disk from the '), 
  write(X), 
  write(' pole to the '), 
  write(Y),
  write(' pole'), nl.
