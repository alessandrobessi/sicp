#lang sicp

; Exercise 1.17

(define (* a b)
    (if (= b 0)
        0
        (+ a (* a (- b 1)))))

(* 2 3)

#|
This algorithm takes a number of steps that is linear in b.

Now suppose we include, together with addition, operations double, which doubles an integer, 
and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure 
analogous to fast-expt that uses a logarithmic number of steps.
|#

(define (double x) (+ x x))
(double 4)

(define (even? x) (= 0 (remainder x 2)))
(even? 4)
(even? 5)

(define (halve x) (/ x 2))

(halve 4)
(halve 5)

(define (fast-mult a b)
    (if (= b 0)
        0
        (cond 
            ((even? b) (double (fast-mult a (halve b))))
            (else (+ a (fast-mult a (- b 1))))
        )
    )
)

(fast-mult 2 3)

#|
(fast-mult 2 3)
(+ 2 (fast-mult 2 2))
(+ 2 (double (fast-mult 2 1)))
(+ 2 (double (+ 2 (fast-mult 2 0))))
(+ 2 (double (+ 2 0)))
(+ 2 (double 2))
(+ 2 4)
6
|#