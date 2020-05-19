qsort([],[]).
qsort([H|T],S) :-
  partition({H}/[X,O]>>compare(O,X,H),T,L,E,G),
  qsort(L,A),
  qsort(G,Z),
  append([A,[H|E],Z],S).

main :-
  length(L,22),
  maplist(random(0,9),L),
  qsort(L,S),
  maplist(writeln,[L,S]).
