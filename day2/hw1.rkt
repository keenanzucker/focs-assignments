#lang racket

;;; Student Name: Keenan Zucker
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with assistance from ___
;;;     and/or using these external resources: http://koreyhinton.com/blog/lisp/racket_cheat_sheet.html

;;     NOTE:  You need not worry about error checking in the programs below.

;; 1.  WRITE SQUARE:  given n, returns n^2.  Hint:  use *
(define (square x)
  (* x x))

(display "Problem 1") (newline)
(display (square 2)) (newline)  ;; -> 4

;; 2.  WRITE is-right-triangle:  given three numbers, returns true iff the third
;;     could be the hypotenuse of a right triangle with the specified three side lengths
;;     Hint:  use = to compare numeric values

(define (is-right-triangle side1 side2 hyp)
  (= (+ (* side1 side1)(* side2 side2))(* hyp hyp)))

(display "Problem 2") (newline)
(display (is-right-triangle 3 4 5)) (newline)  ;; -> #t
(display (is-right-triangle 4 5 6)) (newline)  ;; -> #f

;; 3.  WRITE FACTORIAL:  given n, returns n!
;;     Hint:  recursion is your friend
(define (fact n)
   (cond [(= n 0) 1] 
         [else (* n(fact (- n 1)))])
)

(display "Problem 3") (newline)
(display (fact 1)) (newline) ;; -> 1
(display (fact 2)) (newline) ;; -> 2

;; 4.  WRITE FIBONACCI:  given n, returns the nth fibonacci number as shown below
;;     Hint:  don't run this on really big numbers!
(define (fib n)
  (cond [(<= n 2) 1]
        [else (+ (fib(- n 1)) (fib(- n 2)))])
)

(display "Problem 4") (newline)
(display (fib 1)) (newline) ;; -> 1
(display (fib 2)) (newline) ;; -> 1
(display (fib 3)) (newline) ;; -> 2
(display (fib 4)) (newline) ;; -> 3
(display (fib 5)) (newline) ;; -> 5
(display (fib 6)) (newline) ;; -> 8


;; 5.  WRITE a procedure that takes a list of numbers and returns the sum of those numbers
;;     Hint:  first, rest, cons

(define (sum lst)
  (cond [(null? lst) 0]
        [else
         (+ (first lst) (sum(rest lst)))]
  )
)

(display "Problem 5") (newline)
(display (sum '(1 2 3 4))) (newline) ;; -> 10
(display (sum '(1 20 300))) (newline) ;; -> 321


;; 6.  WRITE a procedure that takes a list of numbers and returns the largest one.
;;     While there are solutions using scheme's built-in max, we were actually hoping you'd do something else...
(define (bigger num1 num2)
  (cond [(> num1 num2) num1]
        [else num2])
)
(define (my-max lst)
  (cond [(null? lst) 0]
        [else
         (bigger (first lst) (my-max(rest lst)))]
  )
)

(display "Problem 6") (newline)
(display (my-max '(1 10 2 20 30))) (newline) ;; -> 20
