% Helper function to handle passing elements in nested list
sum-calculator-no-list([],0). % Handle base case of empty list
sum-calculator-no-list([Head|Tail],N) :- % Handles things that are numbers
    number(Head), % Check if element is a number
    sum-calculator-no-list(Tail, RecursedSum), % Continue traversing for more elements
    N is Head + RecursedSum. % Add all numbers together to equal N
sum-calculator-no-list([Head|Tail],N) :- % Handles things that are not numbers
    not(number(Head)), % Do check if element is not a number
    sum-calculator-no-list(Tail, N). % Continue traversing list without doing anything for that element

% Helper function to handle adding elements in nested list
sum-up-numbers-simple([],0). %Base case where list is empty
sum-up-numbers-simple(L,N) :-
    L = [Head|Tail]
    .
