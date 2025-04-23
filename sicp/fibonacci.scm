#! /usr/bin/env guile
!#

(use-modules (ice-9 format))

(define N 42)

(define (fib-hof)
  (let ((a 0)
	(b 1))
    (lambda ()
      (let ((value a))
	(set! a b)
	(set! b (+ b value))
	value))))

(display "Fibonacci Sequence (using fib-hof):\n")

(let ((f (fib-hof)))
  (for-each (lambda (i)
	      (format #t "~d:\t~d\n" i (f)))
	    (iota N 0)))

(define (fib-iter n)
  (fib-iter-aux 1 0 n))

(define (fib-iter-aux a b count)
  (if (= count 0)
      b
      (fib-iter-aux (+ a b) a (- count 1))))

(format #t "(fib-iter ~d) => ~d\n" (- N 1) (fib-iter (- N 1)))

(define (fib-naive n)
  (cond
   ((= n 0)
    0)
   ((= n 1)
    1)
   (else
    (+ (fib-naive (- n 1))
       (fib-naive (- n 2))))))

(format #t "(fib-naive ~d) => ~d\n" (- N 1) (fib-naive (- N 1)))
