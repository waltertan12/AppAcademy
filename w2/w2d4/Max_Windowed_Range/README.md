# Max Windowed Range

Given an array, and a window size `w`, find the maximum range
(`max - min`) within an ordered set of `w` elements.

Let's say we are given the array [1, 2, 3, 5] and a window size of 3.
Here, there are only two cases to consider:

```
1. [1 2 3] 5
2. 1 [2 3 5]
```

In the first case, the difference between the max and min elements of
the window is two (`3 - 1 == 2`). In the second case, that difference is
three (`5 - 2 == 3`). We want to write a function that will return the
larger of these two differences.

# Approach

This problem was initially solved with a naive approach of calling Array#max and Array#min. These calls require an O(n) complexity resulting in an O(n^2) overall complexity.

To reduce the complexity, we built a Queue data structure (MinMaxStackQueue) with an O(1) max and min. This Queue utilizes two Stacks (`@in` and `@out`)to mimic the Queue methods enqueue and dequeue. To imagine how this works, just imagine trying to get the toy hidden in a box of cereal. Normally, someone eats through the box of cereal before they find the toy which means the first thing put in (the toy) is the last thing out. However, to access the toy immediately, all we need to do is open the box from the bottom or invert the bag.

The MinMaxStackQueue structure basically does this. Items are always placed into the `@in` stack. And, when a user wants to pull out the first item, we invert the `@in` stack to the `@out` stack then simply pop off the `@out` stack; thus, the user can always retreive the first item in the stack.