% Practical 6: Breadth-First Search (BFS) for shortest path
% in an unweighted graph.

% Undirected graph edges
edge(a, b). edge(b, a).
edge(a, c). edge(c, a).
edge(b, d). edge(d, b).
edge(b, e). edge(e, b).
edge(c, f). edge(f, c).
edge(d, g). edge(g, d).
edge(e, g). edge(g, e).
edge(f, g). edge(g, f).

bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).
bfs_queue([CurrentPath|OtherPaths], Goal, Result) :-
    CurrentPath = [Current|_],
    findall(
        [Next|CurrentPath],
        (edge(Current, Next), \+ member(Next, CurrentPath)),
        NewPaths
    ),
    append(OtherPaths, NewPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, Result).

% Example query:
% ?- bfs(a, g, Path).
% One shortest path: Path = [a,b,d,g].
