(define-module (binary-search-tree-test)
  #:use-module (binary-search-tree)
  #:use-module (srfi srfi-64)
  #:export     (run-tests))

(define balanced-keys
  '(10 5 15 2 8 12 20 1 3 6 9 11 13 17 19 4 7 14 16 18))

(define (test-inorder)
  (test-begin "inorder")

  (define bst (make-bst))

  (for-each
   (lambda (key)
     (set! bst (insert bst key))
     (test-assert (format #f "Inserted ~a" key)
		  (search bst key)))
   balanced-keys)

  (define (ascending? a b) (< a b))

  (test-assert "Inorder bst should be sorted."
	       (equal? (inorder bst) (sort balanced-keys ascending?)))
  (test-end))

(define (test-remove)
  (test-begin "remove")

  (define bst (make-bst))

  (test-assert "Remove on an empty tree returns '()."
	       (eq? (remove bst 42) '()))

  (set! bst (insert bst 42))
  (test-assert "Inserted 42" (search bst 42))

  (set! bst (remove bst 42))
  (test-assert "Removed 42" (not (search bst 42)))

  (for-each
   (lambda (key)
     (set! bst (insert bst key))
     (test-assert (format #f "Inserted ~a" key)
		  (search bst key)))
   balanced-keys)

  (for-each
   (lambda (key)
     (set! bst (remove bst key))
     (test-assert (format #f "Removed ~a" key)
		  (not (search bst key))))
   balanced-keys)


  (test-end))

(define (test-search)
  (test-begin "search")

  (define bst (make-bst))

  (test-assert "Searching in an empty tree returns #f."
	       (not (search bst 42)))

  (set! bst (insert bst 42))

  (test-assert "Searching for root element works."
	       (search bst 42))

  (test-assert "Searching for a non-existent, non-root element returns #f."
	       (not (search bst 36)))

  (set! bst (insert bst 36))

  (test-assert "Searching for a non-root element works."
	       (search bst 36))

  (for-each
   (lambda (key)
     (set! bst (insert bst key))
     (test-assert (format #f "Inserted ~a" key)
		  (search bst key)))
   balanced-keys)

  (test-end))

(define (run-tests)
  (test-inorder)
  (test-remove)
  (test-search))

(run-tests)
