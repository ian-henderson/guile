#! /usr/bin/env guile
!#

(use-modules (ice-9 format))

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x)

  (define (good-enough? guess)
    (let ((diff (abs (- (square guess) x))))
      (< diff (/ guess 100000000))))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (sqrt-iter guess)
    (if (good-enough? guess)
	guess
	(sqrt-iter (improve guess))))

  (sqrt-iter (if (> x 1.0) (/ x 2.0) 1.0)))

(for-each
 (lambda (x)
   (format #t "(sqrt ~a) = ~f\n" x (sqrt x)))
 '(49 101 19216801 0.000000004))
