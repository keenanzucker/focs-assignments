#lang racket

(define (list-length xs)
	(foldl + 0 (map (lambda (x) 1) xs))
)

(display "Problem 1") (newline)
(display (list-length '(a b c d e))) (newline)

(define (count-evens xs)
	(list-length (filter even? xs))
)

(display "Problem 2") (newline)
(display (count-evens '(1 2 3 4 5))) (newline)


(define (list-square xs)
	(map (lambda (x) (* x x)) xs)
)

(display "Problem 3") (newline)
(display (list-square '(1 2 3 4 5))) (newline)

(define (list-add1 xs)
	(map (lambda (x) (+ 1 x)) xs)
)

(display "Problem 4") (newline)
(display (list-add1 '(1 2 3 4 5))) (newline)

(define (list-add10 xs)
	(map (lambda (x) (+ 10 x)) xs)
)

(display "Problem 5") (newline)
(display (list-add10 '(1 2 3 4 5))) (newline)

(define (list-addn n xs)
	(map (lambda (x) (+ n x)) xs)
)

(display "Problem 6") (newline)
(display (list-addn 100 '(1 2 3 4 5))) (newline)


(define (filter-even xs)
	(filter even? xs)
)

(display "Problem 7") (newline)
(display (filter-even '(1 2 3 4 5))) (newline)


(define (filter-positive xs)
	(filter (lambda (x) (< 0 x)) xs)
)
(display "Problem 8") (newline)
(display (filter-positive '(-1 2 -3 -4 5 -19))) (newline)

(define (filter-gt lower xs)
	(filter (lambda (x) (< lower x)) xs)
)
(display "Problem 9") (newline)
(display (filter-gt -2 '(-1 2 -3 -4 5 -19))) (newline)

