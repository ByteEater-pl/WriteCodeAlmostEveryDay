transpose_opt([],[]) :- !.
transpose_opt(L,M) :-
  maplist(go,L,C,R),
  step(C,R,M).
go([],none,[]).
go([H|T],some(H),T).
step(C,_,[]) :- list_to_set(C,[none]), !.
step(C,R,[C|S]) :- transpose_opt(R,S).

transpose(L,M) :-
  transpose_opt(L,O),
  maplist(
    [X,Y]>>(
      maplist([X,Y]>>(X=..[_|Y]),X,V),
      append(V,Y)
    ),O,M).
