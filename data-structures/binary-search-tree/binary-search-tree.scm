(define-module (binary-search-tree)
  #:export (inorder insert make-bst remove search))

;;; Binary Search Tree

(define (make-bst) '())

;;; Node

(define (make-node key left right)
  (list 'node key left right))

(define (node-key node) (cadr node))

(define (node-left node) (caddr node))

(define (node-right node) (cadddr node))

;;; Operations

(define (find-min bst)
  (if (null? (node-left bst))
      bst
      (find-min (node-left bst))))

(define (insert bst key)
  (cond
   ;; create new node
   ((null? bst)
    (make-node key '() '()))

   ;; insert in left subtree
   ((< key (node-key bst))
    (make-node
     (node-key bst)
     (insert (node-left bst) key)
     (node-right bst)))

   ;; insert in right subtree
   ((> key (node-key bst))
    (make-node
     (node-key bst)
     (node-left bst)
     (insert (node-right bst) key)))

   ;; key is already in tree, do nothing
   (else bst)))

(define (remove bst key)
  (cond
   ;; node with key wasn't found; return an empty tree
   ((null? bst)
    '())

   ;; recurse to left subtree
   ((< key (node-key bst))
    (make-node
     (node-key bst)
     (remove (node-left bst) key)
     (node-right bst)))

   ;; recurse to right subtree
   ((> key (node-key bst))
    (make-node
     (node-key bst)
     (node-left bst)
     (remove (node-right bst) key)))

   ;; key matches current node's key
   (else
    (let ((left  (node-left bst))
	  (right (node-right bst)))
      (cond
       ;; remove node if it's a leaf with no children
       ((null? left)  ; no left child, replace with right
	right)
       ((null? right) ; no right child, replace with left
	left)
       (else
	;; replace node with inorder successor if the node has two children
	;; (smallest key in right subtree)
	(let* ((successor     (find-min right))
	       (successor-key (node-key successor))
	       (new-right     (remove right successor-key)))
	  (make-node successor-key left new-right))))))))

(define (search bst key)
  (cond
   ;; key not found
   ((null? bst)
    #f)

   ;; key found
   ((= key (node-key bst))
    #t)

   ;; search in left subtree
   ((< key (node-key bst))
    (search (node-left bst) key))

   ;; search in right subtree
   ((> key (node-key bst))
    (search (node-right bst) key))))

(define (inorder bst)
  (if (null? bst)
      '()
      (append (inorder (node-left bst))
	      (list    (node-key bst))
	      (inorder (node-right bst)))))
