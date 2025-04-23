#! /usr/bin/env guile
!#

(define (fib)
  (let ((a 0)
	(b 1))
    (lambda ()
      (let ((value a))
	(set! a b)
	(set! b (+ b value))
	value))))

(define target 40)

(display "Fibonacci Sequence:\n")

(let ((f (fib)))
  (for-each
    (lambda (i)
      (format #t "~a:\t~a\n" i (f)))
    (iota target 0)))

(define (fib-naive n)
  (cond
    ((= n 0)
     0)
    ((= n 1)
     1)
    (else
      (+ (fib-naive (- n 1))
	 (fib-naive (- n 2))))))

(format #t "Fibonacci Naive Computation: ~a\n" (fib-naive (- target 1)))

(exit)
