;;; Ch 1.2 scratchpad
;; Linear Recursive
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 1)
(factorial 5)

;; Linear Iterative -- also tail-recursive
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

(define (factorial n)
  (fact-iter 1 1 n))

(factorial 6)

;; Tree Recursion
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 5)
(fib 6)
(fib 7)

;; better fib
(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fib n)
  (fib-iter 1 0 n))

(fib 5)
(fib 6)
(fib 7)

;; Changing coins example
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (count-change amount)
  (cc amount 5))

(count-change 25)

(count-change 5)

(count-change 5)
(cc 5 5)
(+ (cc 5 (- 5 1))
   (cc (- 5 (first-denomination 5))
       5))
(+ (cc 5 4)
   (cc -45 5))
