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

;; Exercise 1.1
10
12
8
3
-6
a ;3
b ;4
19
#f
4
16
6
12

;; Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;; Exercise 1.3
(define (bigger-sum-squares x y z)
  ())
