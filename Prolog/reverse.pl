rev([],[]).
rev([A],[A]).
rev([A|T],[Z|R]) :-
  rev(T,[Z|K]),
  rev(K,L),
  rev([A|L],R).

main :-
  rev([1,2,3,4],X),
  write(X).
