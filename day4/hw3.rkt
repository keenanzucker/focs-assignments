#lang racket

;;; Student Name: Keenan Zucker
;;;
;;; Check one:
;;; [X] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.

(define op-list
  (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)
        (list 'GT >)
        (list 'LT <)
        (list 'GE >=)
        (list 'LE <=)
        (list 'EQ =)
        (list 'NEQ (lambda (x y) (not (= x y))))
        (list 'ANND (lambda (x y) (and x y)))
        (list 'ORR (lambda (x y) (or x y)))
        (list 'NOTT not)))


(define (assq key alist)
	(cond ((null? alist) #f)
		  ((eq? key (first (first alist))) (first alist))
		  (else (assq key (rest alist))))
)

(display (assq 'ADD op-list)) (newline)


;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define (calculate x)
    (cond ((number? x) x)
    	  ((eq? (first x) 'evaluate) (evaluate (second x) (third x)))
    (else
      (cond ((eq? (first x) 'ADD) (+ (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'SUB) (- (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'MUL) (* (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'DIV) (/ (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'GT) (> (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'LT) (< (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'GE) (>= (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'LE) (<= (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'EQ) (= (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'NEQ) (not eq? (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'ANND) (and (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'ORR) (or (calculate (second x)) (calculate (third x))))
            ((eq? (first x) 'NOTT) (not (calculate (second x)) (calculate (third x))))
      )
    )
  )
)

(define (evaluate key lookup-list)
	(second (assq key lookup-list))
)

(display (evaluate 'x '((x 3) (y 12) (z 2)))) (newline)
(display (calculate (evaluate 'x '((x 10) (y 12) (z 2))))) (newline)



