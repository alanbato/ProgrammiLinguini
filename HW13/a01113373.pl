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
% findPath(G, Ini, Fin, Res) :- W is getPath().
% findPath(G, F, T, X).

% Number, Color, Owner, Animal, Cigarrete, Drink
rule1(Houses) :- member(H, Houses), H = [_,red, english, _, _, _].
rule2(Houses) :- member(H, Houses), H = [_,_, spanish, dog, _, _].
rule3(Houses) :- member(H, Houses), H = [_,green, _, _, _, coffee].
rule4(Houses) :- member(H, Houses), H = [_,_, ukranian, _, _, tea].
rule5(Houses) :-
  member(H1, Houses),
  member(H2, Houses),
  H1 = [L,white,_,_,_,_],
  H2 = [R,green,_,_,_,_],
  abs(R-L, 1).
rule6(Houses) :- member(H, Houses), H = [_,_,_,serpent,winston,_].
rule7(Houses) :- member(H, Houses), H = [_,yellow,_,_,kool,_].
rule8(Houses) :- member(H, Houses), H = [3,_,_,_,_,milk].
rule9(Houses) :- member(H, Houses), H = [1,norwegian,_,_,_,_].
rule10(Houses) :-
  member(H1, Houses),
  member(H2, Houses),
  H1 = [L,_,_,_,chesterfield,_],
  H2 = [R,_,_,fox,_,_],
  abs(R-L, 1).
rule11(Houses) :-
  member(H1, Houses),
  member(H2, Houses),
  H1 = [L,_,_,horse,_,_],
  H2 = [R,_,_,_,kool,_],
  abs(R-L, 1).
rule12(Houses) :-
  member(H, Houses),
  H = [_,_,_,_,_,_].
rule13(Houses) :-
  member(H, Houses),
  H = [_,_,_,_,luckyStrike,juice].
rule14(Houses) :-
  member(H, Houses),
  H = [_,japanese,_,_,kent,_].
rule15(Houses) :-
  member(H1, Houses),
  member(H2, Houses),
  H1 = [_,norwegian,_,_,_,_],
  H2 = [_,_,blue,_,_,_].
einstein(Houses) :-
  rule1(Houses),
  rule2(Houses),
  rule3(Houses),
  rule4(Houses),
  rule5(Houses),
  rule6(Houses),
  rule7(Houses),
  rule8(Houses),
  rule9(Houses),
  rule10(Houses),
  rule11(Houses),
  rule12(Houses),
  rule13(Houses),
  rule14(Houses),
  write(Houses),false.
  

