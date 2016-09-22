# FOCS Day 7 Homework
## Keenan Zucker

## 1. FSA to Regular Expression

a.  	`/01(11)\*0/`

b. 		`/0\*10\*/`

c. 		`/(1\*01\*)/`

## 2. Parenthesis Matching

**a**. Construct a regular expression that matches strings where each `(` is followed immediately by a `)`.

`/((\\(\\))+)/`

**b**. Construct a regular expression that matches strings where the parentheses match, with depth <= 2.

`/(\\((\\(\\))\*\\))\*/`


**c**. Construct a regular expression that accepts strings where the parentheses match, with depth <= 3.

`/(\\((\\((\\(\\))\*\))\*\\))\*/`


## 3. [optional] Challenge Problems

Construct these. Some you may be able to do by just by thinking. Some may be easier if you construct an automaton and then convert it.

- A regular expressions that matches strings with an odd number of 1s.

`/1(11)\*/`

- A regular expressions that matches strings with an even number of 0s.

`/(00)\*/`

- A regular expressions that matches strings with an odd number of 1s AND an even number of 0s.

//

- A regular expressions that matches strings with an odd number of 1s OR an even number of 0s.

`/(1(11)\*|)((00)\*)/`
