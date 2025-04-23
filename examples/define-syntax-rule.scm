#! /usr/bin/env guile
!#

(define-syntax-rule
  (for (item lst) body ...)
  (for-each (lambda (item)
	      body ...)
	    lst))

(for (str '("strawberries" "bananas" "grapes"))
     (format #t "I just love ~a!!!\n" (string-upcase str)))

(exit)
