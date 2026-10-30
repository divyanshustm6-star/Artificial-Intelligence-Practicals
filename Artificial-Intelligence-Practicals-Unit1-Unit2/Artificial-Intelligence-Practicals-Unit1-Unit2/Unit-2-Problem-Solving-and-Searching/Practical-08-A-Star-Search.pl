% Practical 8: A* Search using f(n) = g(n) + h(n).
% The open list is ordered by f; path-cycle checks prevent loops.

:- use_module(library(pairs)).

% Directed graph with positive step costs.
edge(a, b, 1).
edge(a, c, 4).
edge(b, d, 2).
edge(b, e, 5).
edge(c, f, 2).
edge(d, g, 5).
edge(e, g, 1).
edge(f, g, 3).

% Admissible heuristic estimates for this example.
heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 4).
heuristic(d, 3).
heuristic(e, 1).
heuristic(f, 2).
heuristic(g, 0).

% Entry: astar(Start, Goal, Path, TotalCost).
astar(Start, Goal, Path, Cost) :-
    astar_search([[0, Start, [Start]]], Goal, Path, Cost).

astar_search(Open, Goal, Path, Cost) :-
    order_by_f(Open, Ordered),
    Ordered = [[Cost, Goal, ReversePath]|_],
    !,
    reverse(ReversePath, Path).

astar_search(Open, Goal, Path, Cost) :-
    order_by_f(Open, [[G, Current, ReversePath]|Remaining]),
    findall(
        [NewG, Next, [Next|ReversePath]],
        (edge(Current, Next, StepCost),
         \+ member(Next, ReversePath),
         NewG is G + StepCost),
        Successors
    ),
    append(Remaining, Successors, NewOpen),
    astar_search(NewOpen, Goal, Path, Cost).

order_by_f(Paths, Ordered) :-
    map_list_to_pairs(path_f, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Ordered).

path_f([G, Node, _], F) :-
    heuristic(Node, H),
    F is G + H.

% Example query:
% ?- astar(a, g, Path, Cost).
% Path = [a,b,e,g], Cost = 7.
