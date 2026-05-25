#lang sicp

#|
Exercise 2.3: Implement a representation for rectangles in
a plane. (Hint: You may want to make use of Exercise 2.2.) In
terms of your constructors and selectors, create procedures
that compute the perimeter and the area of a given rectan-
gle. Now implement a diﬀerent representation for rectan-
gles. Can you design your system with suitable abstraction
barriers, so that the same perimeter and area procedures
will work using either representation?
|#

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-size base height)
  (cons base height))

(define (base-size s)
  (car s))

(define (height-size s)
  (cdr s))

(define (make-rectangle bottom-left-point size)
  (cons bottom-left-point size))

(define (bottom-left-rectangle r)
  (car r))

(define (size-rectangle r)
  (cdr r))

(define (base-rectangle r)
  (base-size (size-rectangle r)))

(define (height-rectangle r)
  (height-size (size-rectangle r)))

(define (area r)
  (* (base-rectangle r)
     (height-rectangle r)))

(define (perimeter r)
  (+ (* 2 (base-rectangle r))
     (* 2 (height-rectangle r))))


(define corner (make-point 1 1))
(define base-height (make-size 2 3))

(define rect (make-rectangle corner base-height))

(display "area = ")
(area rect)

(display "perimeter = ")
(perimeter rect)