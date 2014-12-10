(define (add a b) (+ a b))

(add 4 5)

(define (square x) (* x x))

(square (+ 1 2))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(abs 5)
(abs -5)

;; 1.1.7
; Square root by Newton's method of approoximation.
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
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

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; 1.1.8
;; sqrt defined with block structure.
;; i.e. scope functions.
;; This function could also remove the need for having x bound to every function call and use it as a free variable.
(define (sqrt x)
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                   x)))
  (sqrt-iter 1.0 x))

(sqrt 16)
