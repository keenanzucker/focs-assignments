#lang racket


(define (tree-add1 tree)
	(cond [(empty? tree) tree]
		[else
			(cond [(number? (first tree))
				(cons (+ (first tree) 1) (tree-add1 (rest tree)))]
				[else (cons (tree-add1 (first tree)) (tree-add1 (rest tree)))])
		]
	)
)

(define (tree-max-depth tree)
	3
)

(display "Problem 1") (newline)
(display (tree-add1 '(3 (1 4))) ) (newline)
(display "Problem 2") (newline)
(display (tree-max-depth '(3 (1 (4 1)) (5 (9 2))))) (newline)