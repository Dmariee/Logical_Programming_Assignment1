sum-up-numbers-simple([], 0). % Base case says the sum is 0 if the list is empty
sum-up-numbers-simple([Head|Tail],Sum) :-   % Split list at the head ; similar to car
  not(is_list(Head)), % Check if the first element is a list
  number(Head),
  sum-up-numbers-simple([Tail, RecursedSum]),   % Use
  Sum is Head + RecursedSum.

