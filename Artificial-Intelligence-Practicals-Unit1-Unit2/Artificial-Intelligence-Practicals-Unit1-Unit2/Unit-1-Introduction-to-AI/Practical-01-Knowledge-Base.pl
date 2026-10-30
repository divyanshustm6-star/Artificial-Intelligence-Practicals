% Practical 1: Create a simple Knowledge Base using facts, predicates,
% clauses and goals (Student-Course Database).
% Run with SWI-Prolog: ?- [ 'Practical-01-Knowledge-Base.pl' ].

% Facts
student(101, divyanshu).
student(102, rahul).
student(103, aman).

course(cse).
course(aiml).
course(data_science).

enrolled(101, aiml).
enrolled(102, cse).
enrolled(103, data_science).

% Rules
student_course(Name, Course) :-
    student(Id, Name),
    enrolled(Id, Course).

% Example queries:
% ?- student(Id, divyanshu).
% Id = 101.
%
% ?- student_course(rahul, Course).
% Course = cse.
%
% ?- enrolled(101, aiml).
% true.
