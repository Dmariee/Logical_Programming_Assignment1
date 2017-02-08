sum-up-numbers-simple([],0).
sum-up-numbers-simple(L,N) :-
    not(is_list(Head)),
    number(Head),
    sum-up-numbers-simple(Tail,Sum1),
    N is Head + Sum1,
    N is N + 0.
