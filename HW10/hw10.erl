-module(hw10).
-export([sumFirst/1, nestedSum/1, removeNestedLists/1, cleanString/1, evaluate/2, toBinaryString/1, zip/2, tuplesToList/1]).

% Sum of first n positive integers
sumFirst(0) -> 0;
sumFirst(N) -> sumFirst(N - 1) + N.

% Calculates the sum of the elements in a list (ignores nested lists).

recursiveSum([]) -> 0;
recursiveSum([H | T]) when is_list(H) -> recursiveSum(T) + hd(H);
recursiveSum([H | T]) -> recursiveSum(T) + H.
nestedSum([]) -> 0;
nestedSum([H | T]) when is_list(H) -> recursiveSum(H) + nestedSum(T);
nestedSum([H | T]) -> nestedSum(T) + H.

% Removes nested lists in the argument and returns all the elements as one single plain list.
removeNestedLists(_) -> io:format("Not yet implemented.~n").

% Cleans a string. Given a string, return recursively a 'cleaned' string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString(_) -> io:format("Not yet implemented.~n").

% Evaluation of polynomials
evaluate(_, _) -> io:format("Not yet implemented.~n").

% Converts a number to a binary string.
toBinaryString(_) -> io:format("Not yet implemented.~n").

% Zipping two lists
zip(_, _) -> io:format("Not yet implemented.~n").

% Lists of tuples
tuplesToList(_) -> io:format("Not yet implemented.~n").
