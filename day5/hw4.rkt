#lang racket

;;; Student Name: Keenan Zucker
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment with assistance from Byron Wasti
;;;     and/or using these external resources: ___



(define operator-list
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
        (list 'ORR (lambda (x y) (or x y)))))

(define (assq key alist)
	(cond ((null? alist) #f)
		  ((eq? key (first (first alist))) (first alist))
		  (else (assq key (rest alist))))
)

(define (calculate expr op-list)
	(cond ((number? expr) expr)
		  ((assq expr op-list)
            (second (assq expr op-list)))
		  ((eq? (first expr) 'IPH)
		  		(if (calculate (second expr) op-list) calculate (third expr)) (calculate (fourth expr)))
		  ((eq? (first expr) 'DEFINE) 
		  		(cons (repl (list (second expr) (third  expr))) op-list))
		  ((list? (first expr)) calculate (first expr) op-list)
		  ((assq (first expr) op-list)
		  	((second (assq (first expr) op-list))
		  		(calculate (second expr) op-list)
		  		(calculate (third expr) op-list))
		  )
	)
)

(define (run-repl)
  (display "welcome to my repl.  type some scheme-ish") (newline)
  (display "hit <RETURN> after typing an expression: ") (newline)
  (repl operator-list))

(define (repl op-list)
  (display "calculate > ")
  (display (calculate (read) op-list))
  (newline)
  (repl op-list))


(run-repl)
