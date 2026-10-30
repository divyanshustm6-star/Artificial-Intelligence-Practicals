% Practical 12: N-Queens using backtracking.
% A solution is a list where the index is the row and the
% value is the column occupied by the queen.

n_queens(N, Solution) :-
    integer(N),
    N > 0,
    numlist(1, N, Columns),
    permutation(Columns, Solution),
    safe_queens(Solution).

safe_queens([]).
safe_queens([Queen|Others]) :-
    safe_diagonals(Queen, Others, 1),
    safe_queens(Others).

safe_diagonals(_, [], _).
safe_diagonals(Queen, [Other|Others], Distance) :-
    abs(Queen - Other) =\= Distance,
    NextDistance is Distance + 1,
    safe_diagonals(Queen, Others, NextDistance).

% Example query:
% ?- n_queens(4, Solution).
% Solutions: [2,4,1,3] and [3,1,4,2].
