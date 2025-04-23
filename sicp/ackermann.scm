#! /usr/bin/env guile
!#

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1) (A x (- y 1))))))

(for-each (lambda (pair)
	    (let ((x (car pair))
		  (y (cdr pair)))
	      (format #t "(A ~a ~a) => ~a\n" x y (A x y))))
	  '((1 . 10) (2 . 4) (3 . 3)))
