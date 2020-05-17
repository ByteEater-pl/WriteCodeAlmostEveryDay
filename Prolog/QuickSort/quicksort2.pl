qsort([],[]).
qsort([H|T],S) :-
  part(H,T,L,E,G),
  qsort(L,A),
  qsort(G,Z),
  append([A,[H|E],Z], S).
part(_,[],[],[],[]).
part(H,[X|T],L,E,G) :-
  compare(R,X,H),
  member([R,[X]],[[<,A],[=,B],[>,C]]),
  append([A,B,C],[X]),
  append(A,K,L),
  append(B,D,E),
  append(C,F,G),
  part(H,T,K,D,F).

main :-
  randseq(9,22,L),
  qsort(L,S),
  writeln(L),
  writeln(S).
