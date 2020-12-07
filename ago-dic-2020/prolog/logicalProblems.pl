solve(Israel, Japan, Phillipines, England, Cuba) :-
    %dominio de las variables
    L = [1,2,3,4,5],
    %que valores puede tomar cada variable
    member(Israel, L),
    member(Japan, L),
    member(Phillipines, L),
    member(England, L),
    member(Cuba, L),
    % restricciones, es lo que resuelve el problema
    Israel < Japan,
    Phillipines > Japan,
    England < Israel,
    England > Cuba, !.

%otra approach al mismo problema
solve(Solution) :-
    length(Solution, 5),
    member(Israel, Solution),
    member(Japan, Solution),
    member(Phillipines, Solution),
    member(England, Solution),
    member(Cuba, Solution),
    before(israel, japan, Solution),
    before(japan, phillipines, Solution),
    before(england, israel, Solution),
    before(cuba, england, Solution), !.


nth1(X, [a,b,c,d,e], d). %te dice la variable donde lo guardaras, la lista, y el elemento a buscar
    % X = 4
nth1(4, [a,b,c,d,e], X). %la puedes usar al rever
    % X = d

before(X, Y, L) :-
    nth1(X1, L, X),
    nth1(Y1, L, Y),
    X1 < Y1. %sale true o false, pero lo rehace hasta que quede true

after(X,Y,L) :-
    before(Y,X,L).

%vertex coloring problem
%cada nodo es una variable, cada uno de esos puede ser azul, rojo o amarillo
solve(N1, N2, N3, N4):-
    L = [blue, red, yellow],
    member(N1, L),
    member(N2, L),
    member(N3, L),
    member(N4, L),
    N1 \= N2,
    N1 \= N4,
    N2 \= N3,
    N2 \= N4,
    N3 \= N4, !.

%einsteins riddle
% 5 houses in 5 dif colors, 5 dif nationalities, 5 drinks, 5 smokes, 5 pets all different
solveEinstein(Solution) :-
    length(Solution, 5), %5 casas, 5 elems
    member([red,_,_,_,englishman], Solution), %en la casa roja vive el britanico
    member([_,dogs,_,_,sweede], Solution), %el sueco tiene perro
    member([_,_,tea,_,dane], Solution), %el danes toma té
    right([green,_,_,_,_], [white,_,_,_,_], Solution), %la casa blanca está a la derecha de la verde
    member([green,_,coffee,_,_], Solution), %la casa verde toma café
    member([_,birds,_,pallmnall,_], Solution), %al que le gustan los pájaros les gustan los pallmall
    member([yellow,_,_,dunhills,_], Solution), %el de la casa amarilla toma dunhills
    Solution = [_,_,[_,_,milk,_,_],_,_], %el de la casa de enmedio toma leche 
    Solution = [[_,_,_,_,norwegian],_,_,_,_] %el de la primera casa es de noruega
    next([_,_,_,dunhills,_]),
    %etc etc
    member([_,_,_,_,_], Solution), !.

right(X,Y,L) :-
    nth1(X1, L, X),
    nth1(Y1, L, Y),
    X1 is Y1 + 1.

next(X, Y, L) :-
    right(X,Y,L);
    right(Y,X,L).


