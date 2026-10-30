% Practical 10: Simulated Annealing for numerical optimization.
% Maximizes f(X) = 25 - (X - 5)^2 over integer X values.
% Worse moves may be accepted probabilistically.

:- use_module(library(random)).

objective(X, Value) :-
    Value is 25 - (X - 5) * (X - 5).

simulated_annealing(Start, BestX, BestValue) :-
    objective(Start, StartValue),
    anneal(Start, StartValue, Start, StartValue, 10.0,
           BestX, BestValue).

anneal(Current, CurrentValue, Best, BestValue, Temperature,
       FinalBest, FinalBestValue) :-
    ( Temperature < 0.01 ->
        FinalBest = Best,
        FinalBestValue = BestValue
    ;
        random_between(-1, 1, Step),
        Candidate is Current + Step,
        objective(Candidate, CandidateValue),
        accept_candidate(Current, CurrentValue,
                         Candidate, CandidateValue,
                         Temperature, Next, NextValue),
        ( NextValue > BestValue ->
            NewBest = Next,
            NewBestValue = NextValue
        ;
            NewBest = Best,
            NewBestValue = BestValue
        ),
        NewTemperature is Temperature * 0.95,
        anneal(Next, NextValue, NewBest, NewBestValue,
               NewTemperature, FinalBest, FinalBestValue)
    ).

accept_candidate(Current, CurrentValue, Candidate, CandidateValue,
                 _Temperature, Candidate, CandidateValue) :-
    CandidateValue >= CurrentValue,
    !.
accept_candidate(Current, CurrentValue, Candidate, CandidateValue,
                 Temperature, Next, NextValue) :-
    Probability is exp((CandidateValue - CurrentValue) / Temperature),
    random_float(RandomValue),
    ( RandomValue < Probability ->
        Next = Candidate,
        NextValue = CandidateValue
    ;
        Next = Current,
        NextValue = CurrentValue
    ).

% Example query:
% ?- simulated_annealing(0, BestX, BestValue).
% BestX should be near 5 and BestValue near 25.
% Exact results can vary because the algorithm is stochastic.
