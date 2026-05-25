#lang sicp

#|
Exercise 2.2: Consider the problem of representing line
segments in a plane. Each segment is represented as a pair
of points: a starting point and an ending point. Define a
constructor make-segment and selectors start-segment and
end-segment that define the representation of segments in
terms of points. Furthermore, a point can be represented
as a pair of numbers: the x coordinate and the y coordi-
nate. Accordingly, specify a constructor make-point and
selectors x-point and y-point that define this representa-
tion. Finally, using your selectors and constructors, define a
procedure midpoint-segment that takes a line segment as
argument and returns its midpoint (the point whose coor-
dinates are the average of the coordinates of the endpoints).
|#

(define (make-segment a b) (cons a b))
(define (segment-start x) (car x))
(define (segment-end x) (cdr x))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (midpoint-segment s)
  (let ((x1 (x-point (segment-start s)))
        (x2 (x-point (segment-end s)))
        (y1 (y-point (segment-start s)))
        (y2 (y-point (segment-end s))))
    (make-point (/ (+ x1 x2) 2) (/ (+ y1 y2) 2))))

(define p1 (make-point 1 2))
(define p2 (make-point 1 4))

(define s (make-segment p1 p2))

(display "segment-start: ")
(segment-start s)

(display "segment-end: ")
(segment-end s)

(display "midpoint: ")
(midpoint-segment s)




