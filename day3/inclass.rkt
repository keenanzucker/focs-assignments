#lang racket

(display "Problem 1") (newline)

(define (tree-add1 tree)
	(cond [(empty? tree) tree]
		[else
			(cond [(number? (first tree)) tree]
				(cons (+ (first tree) 1) (tree-add1 (rest tree)))
				[else (cons (tree-add1 (first tree)) (tree-add1 (rest tree)))]
		]
	)
)

(display (tree-add1 '(3 (1 4))) )(newline)