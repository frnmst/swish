/*
Computing the probability of a path between two nodes in a probabilistic graph.
Each edge has a probability of being present.
From
L. De Raedt, A. Kimmig, and H. Toivonen. ProbLog: A probabilistic Prolog and 
its application in link discovery. In International Joint Conference on 
Artificial Intelligence, pages 2462-2467, 2007.
*/
:- use_module(library(pita)).
:- style_check(-discontiguous).
:- cplint.

% path(X,Y) is true if there is a path between nodes X and Y
% edge(a,b) indicates that there is an edge between a nad b

path(X,X).
% there is surely a path between a node and itself

path(X,Y):-
  edge(X,Z),path(Z,Y).
% there is surely a path between X and Y if there is another node Z such that
% there is an edge between X and Z and there is a path between Z and Y

edge(a,b):0.2.
% there is an edge between a and b with probability 0.2
edge(a,c):0.3.
edge(c,d):0.4.
edge(d,e):0.4.
edge(a,e):0.1.

:- end_cplint.

/** <examples>

?- prob(path(a,e),Prob). % what is the probability that a and e are connected?

*/