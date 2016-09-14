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

; (display "Problem 1") (newline)
; (display (tree-add1 '(3 (1 4))) ) (newline)
; (display "Problem 2") (newline)
; (display (tree-max-depth '(3 (1 (4 1)) (5 (9 2))))) (newline)




(define (factorial num)
	(fact-helper num 1)
)

(define (fact-helper num acc)
	(if (> 1 num)
		acc
	(fact-helper ( - num 1) (* num acc)))
)

(display "Problem Zero")(newline)
(display (factorial 4)) (newline)


(define (my-filter op lst)
	(filter-helper op (reverse lst) '())
)

(define (filter-helper op lst so-far)
	(if (null? lst)
		so-far
		(if (op (first lst)) (filter-helper op (rest lst) (cons(first lst) so-far))
			(filter-helper op (rest lst) so-far)
	))
)

(display "Problem One")(newline)
(display (my-filter even? '(1 2 3 4 5 6))) (newline)


(define (my-append lst1 lst2)
	(my-append-helper (reverse lst1) lst2)
)

(define (my-append-helper lst acc)
	(if (null? lst) acc
		(my-append-helper (rest lst) (cons (first lst) acc))
))

(display "Problem Two")(newline)
(display (my-append '(1 2 3) '(4 5 6))) (newline)



(define (my-zip lst1 lst2)
	(my-zip-helper lst1 lst2 '())
)

(define (my-zip-helper lst1 lst2 acc)
	(cond (null? lst1) (acc)
		(null? lst2) (acc)
	(else (my-zip-helper (rest lst1) (cons (cons (first lst2) (first lst2)) acc))))
)

(display "Problem Three") (newline)
(display (my-zip '(1 2 3) '(a b c d))) (newline)