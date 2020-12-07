%para sacar head y tail
head([H | _], H).
snd([_, S | _], S).
tail([_ | T], T).

% X1 = 12, 25, 17
% X2 = 5, 9, 13, 20
% X3 = 106, 99

%el :- es como el -> en erlang, precede las conficiones
solve(X1, X2, X3) :-
    member(X1, [12, 25, 17]),
    member(X2, [5, 9, 13, 20]),
    member(X3, [106, 99]). %te toma los primeros de cada lista
    write(X1), write(X2), write(X3), nl, fail.
    %el nl es salto de linea
    %dice fail para que no tengas que sacar cada uno por separado, hace todo de un jalon
%cuando se acaben los valores en X3 (pq es el más pequeño) lo loopea, te dará en la tercera un 17, 13, 106 

solveConCondiciones(X1, X2, X3) :-
    member(X1, [12, 25, 17]),
    member(X2, [5, 9, 13, 20]),
    member(X3, [106, 99]). %te toma los primeros de cada lista
    X2 < X1,
    X3 < 100.
    write(X1), write(X2), write(X3), nl, fail.

%write all elements in a list
writeAll([]). %si emptylist, acaba
writeAll([H|T]):- write(H), nl, writeAll(T). %escribe el primero, newline, y después llama a la función con el sig, regresa trup

%useful predicates
%member(a, [a,b,c]).   regresa true
%length([a,b,c,d], X).   regresa X=4   eso de poner la X al final es cuando quieres que te regerse algo que no es true or false
%reverse([1,2,3,4],X).   regresa X=[4,3,2,1]
%append([1,2,3], [a,b], X).  regresa X=[1,2,3,a,b]

xMember(X, [X|_]).
xMember(X, [_|Y]) :- xMember(X, Y), !. %el exclamation point dice que cuando encuentra una solucion ya para (pq en prolog te puede dar varias soluciones)
%no le pones return true, pq en prolog siempre que no matchea con algo más, regresa true, poreso no tienes caso para la empty list (cuando no lo encuentra)

xReverse(X, Y) :- rev(X, [], Y).

rev([], L, L).
rev([H|T], X, Y) :- rev(T, [H|X], Y), !.

