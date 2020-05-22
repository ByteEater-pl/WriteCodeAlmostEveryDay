transpose_opt([],[]) :- !.
transpose_opt(L,M) :-
  maplist(go,L,C,R), (
    forall(member(X,C),X=none) ->
      M=[];
      transpose_opt(R,S), M=[C|S]).
go([],none,[]).
go([H|T],some(H),T).

transpose(L,M) :-
  transpose_opt(L,O),
  maplist(
    [X,Y]>>(
      maplist([X,Y]>>(X=..[_|Y]),X,V),
      append(V,Y)
    ),O,M).
