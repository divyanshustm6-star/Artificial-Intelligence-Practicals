% Practical 3: append, reverse, member search and list length.

% Append two lists
my_append([], List, List).
my_append([Head|Tail], List, [Head|Result]) :-
    my_append(Tail, List, Result).

% Reverse a list
my_reverse(List, Reversed) :-
    my_reverse_acc(List, [], Reversed).

my_reverse_acc([], Accumulator, Accumulator).
my_reverse_acc([Head|Tail], Accumulator, Result) :-
    my_reverse_acc(Tail, [Head|Accumulator], Result).

% Search for an element
my_member(Element, [Element|_]).
my_member(Element, [_|Tail]) :-
    my_member(Element, Tail).

% Find list length
my_length([], 0).
my_length([_|Tail], Length) :-
    my_length(Tail, TailLength),
    Length is TailLength + 1.

% Example queries:
% ?- my_append([1,2], [3,4], R).       R = [1,2,3,4].
% ?- my_reverse([1,2,3,4], R).         R = [4,3,2,1].
% ?- my_member(3, [1,2,3,4]).          true.
% ?- my_length([10,20,30,40], N).      N = 4.
