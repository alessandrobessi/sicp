#lang sicp

; Exercise 1.9

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; vs

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; This is a beautiful exercise because the two procedures compute the same result, 
; but generate very different processes.

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; Now evaluate (+ 4 5) using the substitution model:

(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

; This process first expands, building up a chain of deferred inc operations. 
; Only when a reaches 0 can the interpreter start applying those pending increments.

; So this is a recursive process.

; Important distinction: the procedure calls itself,
; but more importantly the process is recursive because it grows and then shrinks.

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; Now evaluate (+ 4 5) using the substitution model:

(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9

; Here, there are no deferred operations. 
; At every step, the state of the computation is fully captured by the current values of a and b.

; So this is an iterative process.

; The key difference is this:

; In the first version, after evaluating (+ (dec a) b), 
; the interpreter still has to remember to apply inc.

; In the second version, the work is done immediately 
; by transferring one unit from a to b: decrement a, increment b, repeat.