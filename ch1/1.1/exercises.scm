;;; Exercise 1.1
10
12
8
3
6
a ;3
b ;4
19
#f
4
16
6
16

;;; Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;;; Exercise 1.3
(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (bigger-sum-squares x y z)
  (cond ((and (< x y) (< x z)) (sum-of-squares y z))
        ((and (< y x) (< y z)) (sum-of-squares x z))
        (else (sum-of-squares y x))))

(= (sum-of-squares 5 6) (bigger-sum-squares 4 5 6))
(= (sum-of-squares 5 6) (bigger-sum-squares 5 3 6))
(= (sum-of-squares 5 6) (bigger-sum-squares 5 6 3))

;;; Exercise 1.4
;; `a-plus-abs-b takes takes two inputs, a and b.  If b is greater than 0 (pos), then (+ a b).  If b is less than 0 (neg), then (- a b).

;;; Exercise 1.5
;; In the applicative order the `(p) will never terminate. because it will conitnue to be evaluated.
;; In the normal order the function will evaluate to 0 (test 0 (p)) => (if (= 0 0) 0 (p)) => (if #t 0 (p)) => 0.

;;; Exercise 1.6
;; When you use the new-if procedure you execution fails because recursion does not end.
;; This happens becuase of applicative-order execution. In the new-if function, both the 'then' and 'else clauses
;; are evaluated applicatively before the predicate. This means that the then-clause in the case of sqrt-iter will
;; not finish evaluation.

;;; Exercise 1.7
(define (sqrt-iter guess x)
  (if (better-good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; Tolerance of 0.001
; guess refers to sqrt value.
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; A better good-enougn where a new guess is calculated and provided as a fraction of the guess (proportionality).
(define (better-good-enough? guess x)
  (< (abs (/ (- (improve guess x)
                guess)
             guess)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; very small sample
(sqrt 0.0001)
; Output value Value: .03230844833048122
; Actual value: 0.01
;; very large value.
(sqrt 1000000000000000)
; Output Value: 31622.776601684047
; Actual value: Did not finish. Exceeds floating point precision.

;;; Exercise 1.8
(define (cbrt-iter guess x)
  (if (cbrt-good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

;; We apply newtons function to our improve method.
(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* guess 2))
     3))

(define (average x y)
  (/ (+ x y) 2))

;; A better good-enougn where a new guess is calculated and provided as a fraction of the guess (proportionality).
(define (cbrt-good-enough? guess x)
  (< (abs (/ (- (improve guess x)
                guess)
             guess)) 0.001))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt 27)
(cbrt 64)
