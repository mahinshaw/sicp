;;; Exercise 1.9
(define (inc n) (+ n 1))
(define (dec n) (- n 1))
;; visualize (+ 4 5) as defined using the given implementaions
;; Implementaion 1 -> Iterative
(+ 4 5)
(inc (+ (dec 4) 5))
(inc (+ 3 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; Implementation 2 -> Iterative
(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ 0 9)
9

;;; Exercise 1.10
;; Ackermann's Function
;; I did not do the manual expansion like above
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10) ;=> 1024
(A 2 4) ;=> 65536
(A 3 3) ;=> 65536

(define (f n) (A 0 n)) ;=> 2*n
(define (g n) (A 1 n)) ;=> 2^n
(define (h n) (A 2 n)) ;=> 2^(2^n)
(define (k n) (* 5 n n)) ;=> 5*(n^2)

(f 3)
(g 3)
(h 4)
(k 2)
