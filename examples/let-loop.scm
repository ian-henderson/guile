#! /usr/bin/env guile 
!#

(let loop ((words '("carrot" "potato" "pea" "celery"))
	   (num-words 0)
	   (num-chars 0))
  (if (eq? words '())
    (format #t "We found ~a words and ~a chars!\n" num-words num-chars)
    (loop (cdr words)
	  (+ num-words 1)
	  (+ num-chars (string-length (car words))))))

(exit)
