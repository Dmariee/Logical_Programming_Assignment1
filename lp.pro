sum-up-numbers-simple([],0). %Base case where list is empty
sum-up-numbers-simple(L,N) :-
    L = [Head|Tail].
