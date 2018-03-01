#lang racket

(define (removeRep x)
(remove_reps x x)
)

(define (remove_reps x lst)
  (if (null? x)
    lst
    (remove_reps (cdr x) (cons (car x) (filter (lambda (a) (not (equal? (car x) a))) lst)))
  )
)

(define (constructMatrix lst r c mat counter)
  (if (= r counter)
  mat
  (constructMatrix (drop lst c) r c (cons (take lst c) mat) (+ 1 counter))
  )
)

(define (list2matrix lst r c)
 (if (> (* r c) (length lst))
  lst
  (reverse (constructMatrix lst r c '() 0))
 )
)

(define (product a b)
(apply append (map (lambda (x) (make_list x b)) a))
)

(define (make_list x b)
  (if (null? b)
  '()
  ;;; (make_list x (cdr b) (append l (list x (car b)))) codigo originale
  (cons (list x (car b)) (make_list x (cdr b) ))
  )
)

(product '(1 2 3) '(4 5 6))