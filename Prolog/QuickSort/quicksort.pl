qsort([],[]).
qsort([H|T],S) :-
  part(H,T,L,E,G),
  qsort(L,A),
  qsort(G,Z),
  append([A,[H|E],Z], S).
part(_,[],[],[],[]).
part(H,[X|T],[X|L],E,G) :- X<H, part(H,T,L,E,G).
part(H,[H|T],L,[H|E],G) :- part(H,T,L,E,G).
part(H,[X|T],L,E,[X|G]) :- X>H, part(H,T,L,E,G).

main :-
  randseq(9,22,L),
  qsort(L,S),
  maplist(writeln,[L,S]).
