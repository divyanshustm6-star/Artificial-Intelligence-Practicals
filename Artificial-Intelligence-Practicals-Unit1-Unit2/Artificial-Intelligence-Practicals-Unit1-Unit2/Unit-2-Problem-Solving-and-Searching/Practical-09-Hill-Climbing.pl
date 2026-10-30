% Practical 9: Hill Climbing for a numerical optimization problem.
% Maximize f(X) = 25 - (X - 5)^2 over integer X values.

objective(X, Value) :-
    Value is 25 - (X - 5) * (X - 5).

neighbour(X, Next) :- Next is X + 1.
neighbour(X, Next) :- Next is X - 1.

hill_climb(Start, Best) :-
    objective(Start, CurrentValue),
    hill_climb_step(Start, CurrentValue, Best).

hill_climb_step(Current, CurrentValue, Best) :-
    findall(
        Value-Next,
        (neighbour(Current, Next),
         objective(Next, Value),
         Value > CurrentValue),
        BetterNeighbours
    ),
    ( BetterNeighbours = [] ->
        Best = Current
    ;
        keysort(BetterNeighbours, Sorted),
        last(Sorted, BestValue-Next),
        hill_climb_step(Next, BestValue, Best)
    ).

% Example queries:
% ?- hill_climb(0, Best).     Best = 5.
% ?- objective(5, Value).     Value = 25.
