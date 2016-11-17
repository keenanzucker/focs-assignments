def wrap(text, max_width):
    """Return the words of `text`, wrapped to a max line length of `line_width`."""

    column = 0
    lines = [[]]
    for word in text.split():
        # print(word)
        # int(column > 0) is 0 if this is the first word on the line;
        # else 1 (to account for the interpolated space)
        if column + int(column > 0) + len(word) > max_width:
            column = 0
            lines.append([])
        lines[-1].append(word)  # lines[-1] is the last item in the lines[] array
        column += int(column > 0) + len(word)
    print()
    return '\n'.join(' '.join(line) for line in lines)

# print(wrap("aaa bb cc ddddd", 6))
# print(wrap('aaaaaaa bb cc ddddddd',5))
# print()
# print(wrap("a b c d e f g h i j k l m n o p qqqqqqqqq", 9))


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