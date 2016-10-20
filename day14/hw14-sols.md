# FOCS Fall 2016 Homework 14

Student Name: Keenan Zucker
Check one:
[X] I completed this assignment without assistance or external resources.
[ ] I completed this assignment with assistance from ___
    and/or using these external resources: ___

## I. Math

In the following problems, we will look at how rapidly different functions grow.  We are interested in figuring out when two functions grow at the same rate.  Our definition of “the same” is:  f(n) grows no faster than g(n) if there is some minimum value for the argument (we’ll call it n0) after which f(n) is no larger than a constant multiple of g(n) -- call it k*g(n).  For example, if f(n) is 367n+1098 and g(n) is 2n, n0 could be 40 and k could be 200:  367n+1098 <= 200*2n for n>40.

For each of the following pairs of functions, identify a multiplier and a minimum value of n for which the first is no larger than the specified multiple of the second.  If you cannot -- if there are no such values -- explain why not.

```
  A. 367n+1098     and     2n                  [n0 = 40; k=200]
  B. n^2 + 2n + 6    and     6n^2 - 25          [n0 = 3; k = 1]
  C. n^3 + n^2 - 2n     and     6n^2 - 25       [nothing, n^3 will always be greater because cubic function vs the squared term.]
  D. 869,438    and    923                      [They are not functions, so any n0, k = 942 ]
  E. 2^n    and    3^n                          [n0 = 0; k=1]
  F. 3^n    and    2^n                          [nothing, 3^n will always grow faster]
  G. log_2 n     and    log_10 n                [nothing, log base 2 will always grow faster]
  H. log_10 n^2    and     log_2 n              [n0 = 1; k=1]
```

## II. Linear data structures

For the following problem, assume that it costs 1 unit to access a structure -- an item in an array, a field in a record you are holding, the first element in a linked list -- whether reading or writing that element.  [Accessing the second element in a linked list costs 2 units if you have a pointer to the list:  1 unit to access the first element/read its “next” pointer, and another unit to access the second element.]

Assume that you have n elements stored in an array and the same n elements stored in a linked list; you have no other references to these data structures.  You may assume that n > 10.  How much does it cost to perform each of the following actions?

```
  A. Read the value of the first element in the array?  In the list?
      i. 1 unit for array
      ii. 1 unit for list
  B. Read the value of the seventh element in the array?  In the list?
      i. 1 unit for array
      i. 7 units for list
  C. Add an element to the array?  [Where is the cheapest place to add it?]  To the list?  [Where is the cheapest place to add it?]
      i. for array, 1 unit, placing it at the end (assuming the array has space at the end, don't have to shift)
      ii. for list, 1 unit add it to the beginner by setting pointer to previous first element
  D. Delete the fifth element from the array?  From the list?
      i. 1 unit for the array (unless you have to shift all of the array elements, in which case it is n-5)
      ii. 5 units for the list
  E. Confirm that a particular element -- say x -- is present in the array?  In the list?
      i. n units for the array
      ii. n units for the list
  F. Confirm that a particular element -- say y -- is NOT present in the array?  In the list?
      i. n units for the array
      ii. n units for the list

Now assume that you can maintain one extra piece of storage for the data structure.  In the case of the array, you may want to maintain a length reference.
In the case of the linked list, what would be similarly helpful?
  i. a pointer to the end of the list
G. How much would it cost now to add an element to the end of the array?  To add an element to the end of the list?
  i. array -> 1 unit (add element to last empty space)
  ii. list -> 1 unit (pointer to the end)

H. How much would it cost now to delete an element from the array?  From the list?  What if it were the final element?  The penultimate element?
  i. el array -> 1 unit
  ii. el list -> n - location of unit
  iii. final el array -> 1 unit
  iv. final el list -> 1 unit (assuming we have pointer to end)
  v. penu el array -> 1 unit
  vi. penu el list -> n - 1 units (unless the list is doubly linked, then 2 units)

Finally, assume that both the array and the linked list are sorted, i.e., that their elements are in some predictable order (say, comparable by < or <=).
  J. How much would it cost to confirm that a particular element -- say x -- is present in the array?  In the list?  To confirm that a particular element -- say y -- is not present in the array?  In the list?
    i. confirm el array -> log n
    ii. confirm el list -> n
    iii. confirm not el array -> log n
    iv. confirm not el list -> n
```
