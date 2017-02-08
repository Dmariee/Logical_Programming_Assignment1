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
% Similar approach just change the function that handles non numbers
sum-calculator-in-list([],0). % Handle base case of empty list
sum-calculator-in-list([Head|Tail],N) :- % Handles things that are numbers
    number(Head), % Check if element is a number
    sum-calculator-in-list(Tail, RecursedSum), % Continue traversing for more elements
    N is Head + RecursedSum. % Add all numbers together to equal N
sum-calculator-in-list([Head|Tail],N) :- % Handles things that are lists
    is_list(Head), % Check if for elements are lists
    sum-calculator-in-list(Head,N), % First element is a list so run the function call on it
    sum-calculator-in-list(Tail, N). % Continue traversing list without doing anything for that element
sum-calculator-in-list([Head|Tail],N) :- % Handles things that are not letters of lists
    not(number(Head)), % Neither of the top 2 conditions so continue with the rest of the list
    sum-calculator-in-list(Tail, N). % Continue traversing the list


%Actual functios that are being called used helper function declarations
sum-up-numbers-simple([],0). %Base case where list is empty
sum-up-numbers-simple(L,N) :-
    [Head|Tail] = L,
    sum-calculator-no-list([Head|Tail],N).

sum-up-numbers-general([],0). %Base case where list is empty
sum-up-numbers-general(L,N) :-
    [Head|Tail] = L,
    sum-calculator-in-list([Head|Tail],N).
