% Practical 2: Arithmetic operations, factorial and Fibonacci using recursion.

% Arithmetic operations
add(A, B, Result) :-
    Result is A + B.

subtract(A, B, Result) :-
    Result is A - B.

multiply(A, B, Result) :-
    Result is A * B.

divide(A, B, Result) :-
    B =\= 0,
    Result is A / B.

% Factorial
factorial(0, 1).
factorial(N, F) :-
    integer(N),
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% Fibonacci: fibonacci(N, F) gives the Nth Fibonacci number,
% where fibonacci(0, 0) and fibonacci(1, 1).
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-
    integer(N),
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

% Example queries:
% ?- add(20, 10, R).             R = 30.
% ?- subtract(20, 10, R).        R = 10.
% ?- multiply(20, 10, R).        R = 200.
% ?- divide(20, 10, R).          R = 2.
% ?- factorial(5, F).            F = 120.
% ?- fibonacci(6, F).             F = 8.
