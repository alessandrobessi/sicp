#lang sicp

#|
Exercise 2.1: Define a better version of make-rat that han-
dles both positive and negative arguments. make-rat should
normalize the sign so that if the rational number is positive,
both the numerator and denominator are positive, and if
the rational number is negative, only the numerator is neg-
ative.

(define (make-rat n d)
    (let ((g (gcd n d)))
    (cons (/ n g) (/ d g)))
)

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
    (display (numer x))
    (display "/")
    (display (denom x))
)

(define one-half (make-rat 2 4))
(print-rat one-half)
|#

(define (make-rat n d)
    (let ((g (gcd n d)))
        (let ((n1 (/ n g)) (d1 (/ d g)))
            (if (< d1 0)
                (cons (- n1) (- d1))
                (cons n1 d1)
            )
        )
    )
)

(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(define one-half (make-rat 2 4))
(print-rat one-half)

(define minus-one-half (make-rat 1 -2))
(print-rat minus-one-half)

(define also-minus-one-half (make-rat -1 2))
(print-rat also-minus-one-half)

(define positive-one-half (make-rat -1 -2))
(print-rat positive-one-half)


