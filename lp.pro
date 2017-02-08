sum-up-numbers-simple([], 0).   %Base case says the sum is 0 if the list is empty
sum-up-numbers-simple([Head|Tail],Sum) :-   %Split list at the head ; similar to car
  sum-up-numbers-simple([Tail, RecursedSum]),   %Use recurcison to get the head of the car of the list
  Sum is Head + RecursedSum.   %Add the inital first element with the value of calling the function on rest of list

