# FOCS Day 7 Homework
## Keenan Zucker

## 1. FSA to Regular Expression

a.  	/01(11)\*0/

b. 		/0\*10\*/

c. 		/(1\*01\*)/

## 2. Parenthesis Matching

**a**. Construct a regular expression that matches strings where each `(` is followed immediately by a `)`.

/((\(\))+)/

**b**. Construct a regular expression that matches strings where the parentheses match, with depth <= 2.

/(\((\(\))\*\))\*/


**c**. Construct a regular expression that accepts strings where the parentheses match, with depth <= 3.

/(\((\((\(\))\*\))\*\))\*/


## 3. [optional] Challenge Problems

Construct these. Some you may be able to do by just by thinking. Some may be easier if you construct an automaton and then convert it.

- A regular expressions that matches strings with an odd number of 1s.

/1(11)\*/

- A regular expressions that matches strings with an even number of 0s.

/(00)\*/

- A regular expressions that matches strings with an odd number of 1s AND an even number of 0s.

//

- A regular expressions that matches strings with an odd number of 1s OR an even number of 0s.

/(1(11)\*|)((00)\*)/

## 4. [optional] Regular Expression practice
These are excellent sources to learn more about, and practice, applied regular expressions.

- [regexcrossword.com](https://regexcrossword.com)
- [regexone.com](https://regexone.com)

## 5. [optional] Extended Regular Expressions

Learn about [character classes](https://regexone.com/lesson/letters_and_digits) `\d\d\d-\d\d\d\d`, [repetition with quantifiers](https://regexone.com/lesson/repeating_characters) `a{2,4}`, [backreferences](http://www.regular-expressions.info/backref.html) `(a|b|c)def\1`, and [anchors](http://www.regular-expressions.info/anchors.html) (`\bword\b`).

Which of these are just notational conveniences, like `[abc]` for `(a|b|c)`?

Which increase the power of regular expressions?