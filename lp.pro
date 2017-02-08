% Helper function to handle rejecting elements in nested list
sum-calculator-no-list([],0). % Handle base case of empty list
sum-calculator-no-list([Head|Tail],N) :- % Handles things that are numbers
    number(Head), % Check if element is a number
    sum-calculator-no-list(Tail, RecursedSum), % Continue traversing for more elements
    N is Head + RecursedSum. % Add all numbers together to equal N
sum-calculator-no-list([Head|Tail],N) :- % Handles things that are not numbers
    not(number(Head)), % Do check if element is not a number
    sum-calculator-no-list(Tail, N). % Continue traversing list without doing anything for that element

% Helper function to handle accepting elements in nested list
% Similar approach just change the function that handles non numbers
sum-calculator-in-list([],0). % Handle base case of empty list
sum-calculator-in-list([Head|Tail],N) :- % Handles things that are numbers
    number(Head), % Check if element is a number
    sum-calculator-in-list(Tail, RecursedSum), % Continue traversing for more elements
    N is Head + RecursedSum. % Add all numbers together to equal N
sum-calculator-in-list([Head|Tail],N) :- % Handles things that are not numbers or lists
    not(number(Head)), % Is not a list or a number so continue with the rest of the list
    sum-calculator-in-list(Tail, N). % Continue traversing the list
sum-calculator-in-list([Head|_],N) :- % Handles things that are lists
    is_list(Head), % Check if the first element is list
    sum-calculator-in-list(Head, N). % First element is a list so run the function call on it


% Helper function that finds the minimum element in a list
calculate-min([],0). % Empty list has a min of 0
calculate-min(L,N) :-
    not(length(L,1)),
    [Head|Tail] = L,
    calculate-min([Head|Tail],N).
calculate-min(L,N) :-
    length(L,1),
    [Head] = L,
    N is Head.
calculate-min(Head,Tail,N) :-
    not(length(Tail,1)),
    [H|T] = Tail,
    Min is min(Head,H),
    calculate-min(Min,T, N).
calculate-min(Head,Tail,N) :- %Handle exceptions for list parsing [array size = 1] last iteration of min function
    length(Tail,1),
    [H] = Tail,
    Min is min(Head,H),
    N is Min.
calculate-min([Head|Tail],N) :-
    calculate-min(Head,Tail,N).

%Actual functios that are being called used helper function declarations
sum-up-numbers-simple([],0). %Base case where list is empty
sum-up-numbers-simple(L,N) :-
    [Head|Tail] = L,
    sum-calculator-no-list([Head|Tail],N).

sum-up-numbers-general([],0). %Base case where list is empty
sum-up-numbers-general(L,N) :-
    [Head|Tail] = L,
    sum-calculator-in-list([Head|Tail],N).



common-unique-elements([], [], []). % Bases case is they're both empty so share empty uniquiness
%common-unique-elements([], [], []).
%common-unique-elements(L1, L2, N) :-
%    [L1X1|L1Y1] = L1,
%    [L2X2|L2Y2] = L2.

