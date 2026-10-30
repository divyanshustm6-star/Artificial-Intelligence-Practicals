% Practical 5: Classify students as topper, average or fail
% using rule-based reasoning.
% Example thresholds: topper >= 85, average >= 50 and < 85, fail < 50.

marks(divyanshu, 92).
marks(rahul, 75).
marks(aman, 45).
marks(rohit, 28).

topper(Name) :-
    marks(Name, Marks),
    Marks >= 85.

average(Name) :-
    marks(Name, Marks),
    Marks >= 50,
    Marks < 85.

fail(Name) :-
    marks(Name, Marks),
    Marks < 50.

classify(Name, topper) :- topper(Name).
classify(Name, average) :- average(Name).
classify(Name, fail) :- fail(Name).

% Example queries:
% ?- classify(divyanshu, Result).   Result = topper.
% ?- classify(rahul, Result).       Result = average.
% ?- classify(aman, Result).        Result = fail.
