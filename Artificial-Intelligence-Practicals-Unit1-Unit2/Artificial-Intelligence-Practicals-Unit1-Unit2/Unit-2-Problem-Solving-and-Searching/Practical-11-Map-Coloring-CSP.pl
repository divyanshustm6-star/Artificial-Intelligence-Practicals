% Practical 11: Map Coloring as a Constraint Satisfaction Problem (CSP).
% Variables: A, B, C, D. Domain: red, green, blue.
% Adjacent regions must have different colors.

color(red).
color(green).
color(blue).

map_coloring(A, B, C, D) :-
    color(A),
    color(B),
    color(C),
    color(D),
    A \= B,
    A \= C,
    B \= C,
    B \= D,
    C \= D.

% Example query:
% ?- map_coloring(A, B, C, D).
% One solution: A = red, B = green, C = blue, D = red.
