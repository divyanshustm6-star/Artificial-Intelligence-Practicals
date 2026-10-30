% Practical 4: College timetable database and queries about
% faculty, subjects, days, times and classrooms.

% timetable(Day, Subject, Time, Faculty, Room).
timetable(monday, ai, 9, professor_sharma, room101).
timetable(monday, dbms, 10, professor_verma, room102).
timetable(tuesday, python, 9, professor_kumar, room103).
timetable(tuesday, java, 11, professor_sharma, room101).
timetable(wednesday, ai, 10, professor_sharma, room101).
timetable(thursday, mathematics, 12, professor_singh, room104).

% Faculty teaching a subject
faculty_for(Subject, Faculty) :-
    timetable(_, Subject, _, Faculty, _).

% Classroom for a subject
classroom_for(Subject, Room) :-
    timetable(_, Subject, _, _, Room).

% Subjects scheduled on a day
subjects_on(Day, Subject) :-
    timetable(Day, Subject, _, _, _).

% Complete schedule details
schedule(Day, Subject, Time, Faculty, Room) :-
    timetable(Day, Subject, Time, Faculty, Room).

% Example queries:
% ?- faculty_for(ai, F).                     F = professor_sharma.
% ?- classroom_for(python, R).               R = room103.
% ?- subjects_on(monday, S).                  S = ai ; S = dbms.
% ?- schedule(tuesday, python, T, F, R).      T = 9, F = professor_kumar, R = room103.
