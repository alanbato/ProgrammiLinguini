square([], []).
square([H|T], [SH | ST]) :- SH is H*H, square(T, ST).

sumFirst(0, 0).
sumFirst(N, NR):- M is N-1, sumFirst(M, MR), NR is MR + N, !.

%no cuenta las sublistas
xLength([], 0).
xLength([_|T], R) :- xLength(T, LR), R is LR + 1, !.

nLength([], 0).
nLength([H|T], L) :- is_list(H), nLength(H, LH), nLength(T, LT), L is LT + LH, !.
nLength([_|T], L) :- nLength(T, LR), L is LR + 1, !.

dotProduct([X], [Y], W) :- W is X * Y, !.
dotProduct([XF|XR], [YF|YR], W) :- dotProduct(XR, YR, WRes), W is XF * YF + WRes, !. 

start :- 
    square([1,2,3,4], SQ), 
    write(SQ), nl,
    sumFirst(100, SH),
    write(SH), nl,
    xLength([1,2,[3, [4, 5]],6, 7], XL),
    write(XL), nl,
    nLength([1,2,[3, [4, 5]],6, 7], NL),
    write(NL), nl, !.