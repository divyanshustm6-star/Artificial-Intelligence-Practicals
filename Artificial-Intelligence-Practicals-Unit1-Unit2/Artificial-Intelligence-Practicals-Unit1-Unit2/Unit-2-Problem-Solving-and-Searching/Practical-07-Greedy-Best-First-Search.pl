% Practical 7: Greedy Best-First Search using a heuristic.
% This implementation orders the frontier by the smallest h(Node).

:- use_module(library(pairs)).

% Directed weighted graph; edge(From, To, Cost).
edge(a, b, 1).
edge(a, c, 1).
edge(b, d, 1).
edge(b, e, 1).
edge(c, f, 1).
edge(d, g, 1).
edge(e, g, 1).
edge(f, g, 1).

% Heuristic estimate from each node to goal g.
heuristic(a, 6).
heuristic(b, 4).
heuristic(c, 5).
heuristic(d, 2).
heuristic(e, 1).
heuristic(f, 3).
heuristic(g, 0).

greedy_best_first(Start, Goal, Path) :-
    greedy_search([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

greedy_search([[Goal|Rest]|_], Goal, [Goal|Rest]).
greedy_search(Frontier, Goal, Result) :-
    select_best_heuristic(Frontier, [Current|Path], Remaining),
    findall(
        [Next,Current|Path],
        (edge(Current, Next, _), \+ member(Next, [Current|Path])),
        NewPaths
    ),
    append(Remaining, NewPaths, Combined),
    order_by_heuristic(Combined, Ordered),
    greedy_search(Ordered, Goal, Result).

select_best_heuristic([Best|Rest], Best, Rest).

order_by_heuristic(Paths, Ordered) :-
    map_list_to_pairs(path_heuristic, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Ordered).

path_heuristic([Node|_], H) :-
    heuristic(Node, H).

% Example query:
% ?- greedy_best_first(a, g, Path).
% With the given heuristic, one returned path is [a,b,e,g].
