#lang sicp

; Exercise 1.3: Define a procedure that takes three numbers
; as arguments and returns the sum of the squares of the two
; larger numbers.

(define (square x) 
    (* x x)
)

(define (sum-of-squares a b)
    (+ (square a) (square b))
)

(display "(square 2) = ")
(square 2)

(display "(square 3) = ")
(square 3)

(display "(sum-of-squares 2 3) = ")
(sum-of-squares 2 3)

(define (sum-square-two-largest a b c)
  (cond
    ((and (<= a b) (<= a c)) (sum-of-squares b c))
    ((and (<= b a) (<= b c)) (sum-of-squares a c))
    (else (sum-of-squares a b)))
)

(display "(sum-square-two-largest 3 2 1) = ")
(sum-square-two-largest 3 2 1)

(display "(sum-square-two-largest 10 9 11) = ")
(sum-square-two-largest 10 9 11)

(display "(sum-square-two-largest 4 5 1) = ")
(sum-square-two-largest 4 5 1)

