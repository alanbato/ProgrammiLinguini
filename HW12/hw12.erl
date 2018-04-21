-module(hw12).
-export([pow/2, fibonacci/1, reverse/1, count/2]).

% pow (tail recursive version)
powAux(N, X, A) -> if
    X == 0 -> A;
    true -> powAux(N, X - 1, A*N)
  end.
pow(N, X) -> powAux(N, X, 1).

% Fibonacci (tail recursive version)

fibonacciAux(A, B, X) -> if 
    X == 0 -> A;
    true -> fibonacciAux(B, A + B, X - 1)
  end.
fibonacci(X) -> fibonacciAux(0, 1, X).

% reverse (tail recursive version)
reverseAux([], R) -> R;
reverseAux([H|T], R) -> reverseAux(T, [H] ++ R).
reverse(L) -> reverseAux(L, []).

% count (tail recursive version

countAux([], _, C) -> C;
countAux([H|T], E, C) when H == E -> countAux(T, E, C + 1);
countAux([_|T], E, C) -> countAux(T, E, C).
count(L, E) -> countAux(L, E, 0).
