qsort([],[]).
qsort([H|T],S) :-
  part(H,T,[L,E,G]),
  qsort(L,A),
  qsort(G,Z),
  append([A,[H|E],Z], S).
part(_,[],[[],[],[]]).
part(H,[X|T],R) :-
  compare(O,X,H),
  member([O,[X]],[[<,A],[=,B],[>,C]]),
  append([A,B,C],[X]),
  maplist(append,[A,B,C],I,R),
  part(H,T,I).

main :-
  length(L,22),
  maplist(random(0,9),L),
  qsort(L,S),
  writeln(L),
  writeln(S).
