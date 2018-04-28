square([Z], [W]) :- W is Z * Z.
square([H|T], X) :- Y is H * H, square(T, Z), append([Y], Z, X).

sumNums(0, 0).
sumNums(N, X) :- Y is N - 1, sumNums(Y, Z), X is N + Z.

xLength([], 0).
xLength([_|T], X) :- xLength(T, Z), X is 1 + Z.

nLenght([], 0).
nLenght([H|T], X) :- nLenght(H, Y), nLenght(T, Z), X is Y + Z.
nLenght(_, 1).

dotProduct([], [], 0).
dotProduct([H1|T1], [H2|T2], X) :- Y is H1 * H2, dotProduct(T1, T2, Z), X is Y + Z.