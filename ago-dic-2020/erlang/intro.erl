-module(intro).
-export([timesTwo/1, factorial/1, reverse/1, convert/1, translate/1]). %nombreDeLaFuncion/CantDeParametros

timesTwo(X) -> 2 * X.

%para compilar le das c(NameOfFile). y luego nameOfFile:function(parametros).
%c(basic). basic:timesTwo(5)

factorial (N) -> if
    N == 0 -> 1;
    N > 0 -> N * factorial(N-1);
    true -> io:format("no support for negative numbers.~n") %este es el else
end. %este es para cerrar el if
% es N pq las mays son mayusculas, si fuera n es un atom y no jala

%el when es una guard, cbeca condiciones, si hay varias con comas entre ellas, es que es un AND

%LISTS
%[1,2,3,4]. iwal que en los denás, nomas con el punto al final
%[]. empty list
%[1 | []]. te da [1]       el | es el cons, mete en first position
%[1,2,3] ++ [4,5,6]. te da [1,2,3,4,5,6], el ++ es append
% hd ([1,2,3]) te da 1  , es head
% tl ([1,2,3]) te da [2,3]  , es tail

reverse([]) -> [];
reverse([X|Y]) -> reverse(Y) ++ [X]. %aqui tmb puedes templatear

%TUPLES
%X es variable, cm es atom
convert ({X, cm}) -> {X * 0.393701, in};
convert ({X, in}) -> {X * 2.54, cm}.
%las tuples van entre {} y los elemnntos separados por , pueden haber más de solo 2

%si no te gustan las guards, puedes usar los cases
translate(Word) -> case Word of %arguments siempre son variables, poreso en este caso es Word aunque la vayas a matchear como atom
    blue -> azul;
    red -> rojo;
    yellow-> amarillo;
    black -> negro;
    white -> blanco;
    _ -> io:format("undefined color. ~n") %aqui no pones true, pones _
end.

%MATRIX, list of lists
% [[1,2,3], [4,5,6], [7,8,9]]

%GRAPHS
%by adjecency lists
%[[a,b,c], [b,a,c,d], [c,a,b], [d,b]] sale mejor usar atoms pq asi ya sabes que todas las a s son las mismas
%by nodes & vertices
%by relationship matrix

%LAMBDA FUNCS
% fun(X,Y) -> X + Y end.
%empiezan con fun, dsps los args entre (), luego ->, después el cuerpo y termina con end.

%MAP
%Sum = fun(X) -> X + 1 end.
%lists:map(Sum, [1,2,3,4]).     regresa [2,3,4,5]
%lists:map(fun(X) -> X + 1 end., [1,2,3,4]).    regresa [2,3,4,5]

%APPLY no es igual a los demás, solo aplica una función
%especificas el modulo donde la función se guarda (math), el nombre la función (sqrt) y los argumentos en una lista
%apply(math, sqrt, [4]).  regresa 2.0

%ALL and ANY
%lists:all(fun(X) -> X > 2.5 end, [1,2,3,4,5]). te da false pq no todos son true
%lists:any(fun(X) -> X > 2.5 end, [1,2,3,4,5]). te da true pq añguno/s es/son true

%FILTER, jala igual que los demás
%lists:filter(fun(X) -> X rem 2 == 0 end, [1,2,3,4,5]. te regresa [2,4]
%lists:filter(fun(X) -> X rem 2 /= 0 end, [1,2,3,4,5]. te regresa [1,3,5]

%erland es EAGER EVALUATION aka todo tiene que jalar pq se evalua antes de correrlo


