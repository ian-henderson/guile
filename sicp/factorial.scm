#! /usr/bin/env guile
!#

;; linear recursive process (naive)
(define (factorial-naive n)
  (if (= n 1)
      1
      (* n (factorial-naive (- n 1)))))

;; linear iterative process
(define (factorial n)
  (factorial-aux 1 1 n))

(define (factorial-aux product counter max-count)
  (if (> counter max-count)
      product
      (factorial-aux (* counter product)
		     (+ counter 1)
		     max-count)))

(define n 6)

(format #t "(factorial-naive ~a) => ~a\n"
	n (factorial-naive n))

(format #t "(factorial ~a) => ~a\n"
	n (factorial n))
