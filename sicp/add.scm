#! /usr/bin/env guile
!#

(define (inc a) (+ a 1))

(define (dec a) (- a 1))

;; linear recursive process (naive)
(define (add-naive a b)
  (if (= a 0)
      b
      (inc (add-naive (dec a) b))))

;; linear iterative process
(define (add a b)
  (if (= a 0)
      b
      (add (dec a) (inc b))))

(define a 10)
(define b 90)

(format #t "(add-naive ~a ~a) => ~a\n"
	a b (add-naive a b))

(format #t "(add ~a ~a) => ~a\n"
	a b (add a b))
