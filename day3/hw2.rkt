#lang racket

;;; Student Name: Keenan Zucker
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment with assistance from: verbal advice from Byron (thanks bud!)
;;;     and/or using these external resources: ___

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.

(define (calculate x)
    (cond ((number? x) x)
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
            ;; ((eq? (first x) 'IPH) (cond (calculate (second x)) (calculate (third x)) (else (calculate (fourth x))))) DOESN'T WORK
      )
    )
  )
)

(display (calculate '(ADD 3 4))) (newline) ;; --> 7
(display (calculate '(SUB 3 4))) (newline) ;; --> -1


;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.

(display (calculate '(ADD 3 (MUL 4 5)))) (newline) ;; --> 23   ;; what is the equivalent construction using list?
(calculate '(SUB (ADD 3 4) (MUL 5 6))) ;; --> -23

;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

  (calculate '(GT (ADD 3 4) (MUL 5 6))) ;; --> #f
  (calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ;; --> #t

;;; 4. Add boolean operations ANND, ORR, NOTT

(calculate '(ANND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ) ;; --> #f

;;; 5. Add IPH

(display (calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3)))) (newline) ;; -> 4
