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
;;
