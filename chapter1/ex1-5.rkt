#lang sicp

; Exercise 1.5: Ben Bitdiddle has invented a test to determine
; whether the interpreter he is faced with is using applicative-
; order evaluation or normal-order evaluation. He defines the
; following two procedures:

(define (p) (p))
(define (test x y)
(if (= x 0) 0 y))

;Then he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that
; uses applicative-order evaluation? What behavior will he
; observe with an interpreter that uses normal-order evalu-
; ation? Explain your answer.

(define (p) (p)) ; Calling (p) calls (p) again, forever. So (p) never returns a value.

; applicative-order evaluation: the interpreter evaluates the arguments before applying the procedure
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p)) ; the program never terminates (infinite recursion)!

; normal-order evaluation: the interpreter does not evaluate arguments before applying the procedure

; so

; (test 0 (p))

; expands to

; (if (= 0 0) 0 (p))

; now the interpreter evaluates the condition (= 0 0) which is True, and it returns

; 0

; the alternative branch (p) is never evaluated!