#lang sicp

(#%require racket/base)

; Exercise 1.11

; recursive process
(define (fr n) 
    (cond
        ((> 3 n) n)
        (else (+ (fr (- n 1)) (* 2 (fr (- n 2))) (* 3 (fr (- n 3))) ))
    )
)

; fr
; Time:  exponential
; Space: O(n)

; iterative process

#|

iterative process in python

def fi(n):
    if n < 3:
        return n

    a = 0  # f(0)
    b = 1  # f(1)
    c = 2  # f(2)

    for count in range(2, n):
        next_value = c + 2 * b + 3 * a

        a = b
        b = c
        c = next_value

    return c
|#

(define (fi n)
    (define (iter a b c count)
        (if (= count n)
            c
            (iter b
                c
                (+ c (* 2 b) (* 3 a))
                (+ count 1))))
    (if (< n 3)
        n
        (iter 0 1 2 2)
    )
)

#|
The meaning of the variables is:

a = f(n - 2)
b = f(n - 1)
c = f(n)

More precisely, during the iteration:

a = f(count - 2)
b = f(count - 1)
c = f(count)

So when count = 2, we start with:

a = f(0) = 0
b = f(1) = 1
c = f(2) = 2

Then the next value is:

f(count + 1) = c + 2b + 3a
|#

; fi
; Time:  O(n)
; Space: O(1)

#|
The recursive version has a recursive process because it expands into a tree of deferred computations.

The iterative version has a recursive procedure but an iterative process 
because the entire state of the computation is carried explicitly in the parameters.
|#

(display "Recursive fr 35:")
(newline)
(time (fr 35))

(display "Iterative fi 35:")
(newline)
(time (fi 35))

