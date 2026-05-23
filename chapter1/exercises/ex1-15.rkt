#lang sicp

; Exercise 1.15

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))

(define pi 3.14)

(sine 0)
(sine (/ pi 2))

(sine 12.15)

#|
p is applied once for every time sine has to divide the angle by 3.0 before the angle 
becomes small enough, that is, before:

(abs angle) <= 0.1

For (sine 12.15), follow the divisions:

12.15
12.15 / 3 = 4.05
4.05 / 3 = 1.35
1.35 / 3 = 0.45
0.45 / 3 = 0.15
0.15 / 3 = 0.05

Now 0.05 <= 0.1, so the recursion stops.

So the recursive calls look like this:

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))

At 0.05, sine returns the angle directly.

Then the pending p applications are performed:

(p (p (p (p (p 0.05)))))

Therefore, p is applied 5 times.

---

We want the order of growth in space and number of steps as a function of a.

Each recursive step divides the angle by 3:

a, a/3, a/9, a/27, ...

The process stops when:

|a| / 3^n <= 0.1

Solving roughly:

3^n >= 10|a|

So:

n >= log_3(10|a|)

Therefore the number of recursive steps grows logarithmically in a.

Each level does a constant amount of work: one division, one test, and later one application of p. 
The procedure p itself does constant work.

So the number of steps is:

Θ(log a)

The space is also:

Θ(log a)

because the process is recursive, not iterative. It has to keep pending operations like:

(p (p (p ...)))

on the stack until it reaches the base case.
|#