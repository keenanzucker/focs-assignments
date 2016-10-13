#lang racket

;;;;;;;;;;
;;; Day 3 in class work

;;;;;;;;;;
;; 0.  Implement factorial both recursively and tail recursively.
;;     Hint:  The tail recursive version will use a helper function.
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

;;;;;;;;;;;
;; 1.  Filter is built in to scheme.

;; (filter even? '(1 2 3 4 5 6))  --> '(2 4 6)  ;; using the built-in even?
;; (filter teen? '(21 17 2 13 4 42 2 16 3)) --> '(17 13 16)
                        ;; assuming (define (teen x) (and (<= 13 x) (<= x 19)))))
;; (filter list? '(3 (3 2 1) symbol (4 2) (1 (2) 3)) --> '((3 2 1) (4 2) (1 (2) 3))

;; Implement it anyway.  You might want to call it my-filter?  What arguments does it take?

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


;;;;;;;;;;;
;; 2.  Map is also built in to scheme.

;; (map double '(1 2 3))  --> '(4 5 6)  ;; assuming (define (double x) (* 2 x))
;; (map incr '(1 2 3)) --> '(2 3 4)     ;; assuming (define (incr x) (+ x 1))
;; (map last '((3 2 1) (4 2) (1 2 3)) --> '(1 2 3)
                                        ;; assuming (define (last lst)
                                        ;;            (if (null? (rest lst))
                                        ;;                (first lst)
                                        ;;                (last (rest lst))))

;; Implement it as well.  You might want to call it my-map.  What arguments does it take?







;;;;;;;;;;;
;; 3.  While we're reimplementing built-ins, implement my-append (just like built in append)
;;     It takes two lists and returns a list containing all of the elements of the originals, in order.
;;     Note that it is purely functional, i.e., it doesn't MODIFY either of the lists that it is passed.

;; (append '(1 2 3) '(4 5 6)) --> '(1 2 3 4 5 6)

;; You might want to draw out the box and pointer structures for the original two lists
;; as well as for the new list.  Confirm with a member of the instructional staff....


(define (my-append lst1 lst2)
	(my-append-helper (reverse lst1) lst2)
)

(define (my-append-helper lst acc)
	(if (null? lst) acc
		(my-append-helper (rest lst) (cons (first lst) acc))
))

(display "Problem Two")(newline)
(display (my-append '(1 2 3) '(4 5 6))) (newline)


;;;;;;;;;;;
;; 4.  zip takes two lists, and returns a list of elements of size two, until one of the lists runs out.

;; (zip '(1 2 3) '(4 5 6)) ;; --> '((1 4) (2 5) (3 6))
;; (zip '(1 2 3) '(a b c d e f g)) ;; --> '((1 a) (2 b) (3 c))

;; Implement `zip`.

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


;;;;;;;;;;;;
;; 5.  Last built-in (for now):  (my-)reverse.
;;     Takes a list, returns a new list with the elements reversed.

;; (reverse '(1 2 3)) --> '(3 2 1)



;;;;;;;;;;;;
;; More puzzles:
;;
;;  - (count elt lst) returns the number of times that elt appears in lst
;;  - (remove-dups lst) returns a new list that contains the elements of lst but without repeats
;;       (remove-dups '(1 2 3 1 4 5 2 4 6)) --> '(1 2 3 4 5 6)
;;  - reverse reverses a list, but doesn't reverse sublists in a tree.  (Try it and see.)
;;    Write deep-reverse, which reverses all sublists as well.
;;  - Which of these can you implement using tail recursion?
