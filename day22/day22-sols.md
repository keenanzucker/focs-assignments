# FOCS Homework 22

```
Student Name: Keenan Zucker
Check one:
[X] I completed this assignment without assistance or external resources.
[ ] I completed this assignment with assistance from ___
   and/or using these external resources: ___
```

## 1. Break dancing

A **line break algorithm**, or **paragraph wrap algorithm**, inserts newlines between words in order to maintain a maximum line length. An [early implementation](http://massis.lcs.mit.edu/archives/technical/western-union-tech-review/10-1/p040.htm) of this algorithm ran on mechanical relays.

Consider the following algorithm:

```python
def wrap(text, max_width):
    """Return the words of `text`, wrapped to a max line length of `line_width`."""
    
    column = 0
    lines = [[]]
    for word in text.split():
        # int(column > 0) is 0 if this is the first word on the line;
        # else 1 (to account for the interpolated space)
        if column + int(column > 0) + len(word) > max_width:
            column = 0
            lines.append([])
        lines[-1].append(word)  # lines[-1] is the last item in the lines[] array
        column += int(column > 0) + len(word)
    return '\n'.join(' '.join(line) for line in lines)

print(wrap("aaa bb cc ddddd", 6))
print()
print(wrap("a b c d e f g h i j k l m n o p qqqqqqqqq", 9))
```

Output:

```
aaa bb
cc
ddddd

a b c d e
f g h i j
k l m n o
p
qqqqqqqqq
```

Questions:

a. Is this algorithm any of: greedy, recursive, dynamic programming (top down), dynamic programming (bottom up)?

- Greedy --> No, I wouldn't say this algorithm is greedy since it is not making an optimization problem at each stage, but rather just following a conditional statement.
- Recursive --> No, this function is not recursive as it does not call itself.
- Dynamic (top down) --> No, this isn't top down because there is no recursion.
- Dynamic (bottom up) --> Yes, this would be considered a bottom up dynamic programming solution, since the problem is being broken down into smaller sections, and also that it used a loop through the words in the paragraph in order.

b. If the text contains a word that is longer than `max_width`, what does this algorithm do?
If the word is longer than max_width, this algorithm just places that word on a line of its own, regardless of how large it is compared to the max width.

c. Does this algorithm produce an optimal result? (Do you have enough information to answer this question?)
It seems like optimal is subjective, but I would say it's not optimal because it it will not work particularily well if the max_width is small, since large individual words will make the line lengths larger than the width. It would be better to split those words up an use a hyphen.

## 2. That's a wrap

Here's a ~~more complicated~~ alternative paragraph algorithm. This uses an explicit representation of Infinity to avoid a special case to rule out lines that are too long.

a. Is this algorithm any of: greedy, recursive, dynamic programming (top down), dynamic programming (bottom up)?

- Greedy --> Yes, this algorithm could be considered greedy because it is doing a local optimization step to select the best candidate within the for loop.
- Recursive --> No, this function is not recursive as it does not call itself.
- Dynamic (top down) --> No, I don't think this is top down dynamic programming.
- Dynamic (bottom up) --> I think this is bottom up dynamic programming because it is still breaking down the problem into smaller subproblems and solving them sequentially.

b. [no question] See [this post by Juraj Sukop](http://xxyxyz.org/line-breaking/) for a more extensive exploration of line breaking algorithms using Python.

```python
import math

def less_ragged(text, max_width):
    """Return the words of `text`, wrapped to a max line length of `line_width`.
    Use Knuth-Plass to minimize the sum of the lines' raggedness
    (the cube of each lines' amount of wasted space)."""
    words = text.split()
    word_count = len(words)
    word_lengths = [len(w) for w in words]
    
    line_cost = {}  # line_cost[i, j] = the raggedness of a line consisting of words[i:j]
    # line_cost[i, j] is equivalent to line_cost[(i, j)]. This code uses a dict (hash) to
    # simulate a 2D array, without as much work to set up. It's less efficient by a
    # constant factor.
    for i in range(word_count):
       line_length = -1  # accumulated length of words[i:j] and their interpolated
    					 # spaces. initialize to -1 to compensate when general case
        				 # adds the first word, that should't include an interpolated
            			# space, to the empty string
        for j in range(i + 1, word_count + 1):
            # the length of the line containing words[i:j] + the j-i interpolated spaces
            line_length = sum(word_lengths[k] for k in range(i, j)) + (j - i - 1)
            slack = max_width - line_length
            line_cost[i, j] = slack ** 3 if slack >= 0 else math.inf
    
    # breaks[j] represents the best place i to break the paragraph words[0:j]
    # into a paragraph words[0:i] followed by a line words[i:j].
    # Its value is the tuple (cost, i) where cost is the cost of this paragraph.
    breaks = [(0, 0)]
    for j in range(1, word_count+1):
        # generate a set of candidate positions at which to start the final line,
        # and the cost of the best paragraph at of these final line positions.
        #
        # each candidate is (cost, i), so that subsequent computation can use the cost
        # (to select the next candidate), and so that the final result can use the line
        # break position i.
        candidates = ((breaks[i][0] + line_cost[i, j], i) for i in range(j))
        # the order is (cost, i) in order to use `min` to select the best candidate.
        # this works because tuple comparison uses lexicographic order.
        breaks.append(min(candidates))

    # start at the end of the paragraph. iterate from the last line to each preceding
    # line, accumulating tuples (i, j) that indicate words[i:j] on each line
    word_ranges = []
    j = word_count
    while j > 0:
        i = breaks[j][1]
        word_ranges.append((i, j))
        j = i
    # word_ranges is ordered from last line to first. iterate over it backwards,
    # to collect the actual words in the order first line -> last line.
    lines = ([words[i:j] for i, j in reversed(word_ranges)])
        
    return '\n'.join(' '.join(line) for line in lines)

print(less_ragged("aaa bb cc ddddd", 5))
print()
print(less_ragged("a b c d e f g h i j k l m n o p qqqqqqqqq", 9))
```

Output:

```
aaa
bb cc
ddddd

a b c d
e f g h
i j k l
m n o p
qqqqqqqqq
```

## 3. Knuth break

The algorithm in #2 was created by [Donald Knuth](https://en.wikipedia.org/wiki/Donald_Knuth), for use in TeX (which he created).

Let's take a break to admire Knuth. Aside from foundational work in computer science:

1. In high school, he invented the [quater-imaginary numeral system](https://en.wikipedia.org/wiki/Quater-imaginary_base), which uses the digits 0, 1, 2, and 3, and the base 2i to represent all the complex numbers.
2. That same year, he published the [Potrzebie system of weights and measures](https://github.com/focs16fall/focs-assignments/blob/master/day22/images/potrzebie_system.gif). For a while, you could enter “1 farshimmelt potrzebie”, “1 ngogn”, or “1 furshlugginer blintz” into Google, to convert the measurement into the corresponding English or metric measure of weight, volume, or mass. Google has dropped this feature, and you now need Mathematica, Wolfram Language, or Wolfram Alpha.
3. Knuth is the originator of “Beware of bugs in the above code; I have only proved it correct, not tried it.”
4. He has his own [t-shirt](https://github.com/focs16fall/focs-assignments/blob/master/day22/images/knuth-tshirt-show.jpg).

