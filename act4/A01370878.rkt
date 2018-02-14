#lang racket

(define (el_exists? x l)
  (not (null? (filter (lambda (a) (= a x) ) l)))
)

(define (idx_h x l i)
  (cond
  [(null? l) -1]
  [(= x (car l)) i]
  [else (idx_h x (cdr l) (+ 1 i))]
  )
)

(define (idx x l)
  (idx_h x l 0)
)

(define (comp x l)
  (cond 
  [(null? l) #f]
  [(= (car l) x) #t]
  [else (comp x (cdr l))]
  )
)

(define (all_different? l)
  (cond 
    [(null? l) #t]
    [(comp (car l) (cdr l)) #f]
    [else (all_different? (cdr l))]
  )
)

(define (remove_dups l nl)
  (if (null? l)
    nl 
    (remove_dups (cdr l) 
      (if (comp (car l) nl)
        nl
        (append nl (list (car l)))
      )
    )
  )
)

(define (my_set l)
  (remove_dups (filter number? l) '())
)

(define (union a b)
  (remove_dups (filter number? (append a b)) '())
)

(define (construct_int a b nl)
  (if (null? a)
    nl 
    (construct_int (cdr a) b
      (if (comp (car a) b)
        (append nl (list (car a)))
        nl
      )
    )
  )
)

(define (intersection a b)
  (remove_dups (construct_int a b '()) '())
)

(define (get_el m i j)
  
)

(define (determinant m)
 (- 
  (+ 
    (* (get_el m 1 1) (get_el m 2 2) (get_el m 3 3))
    (* (get_el m 1 2) (get_el m 2 3) (get_el m 3 1))
    (* (get_el m 1 3) (get_el m 2 1) (get_el m 3 2))
    )
  (+ 
    (* (get_el m 3 1) (get_el m 2 2) (get_el m 1 3))
    (* (get_el m 3 2) (get_el m 2 3) (get_el m 1 1))
    (* (get_el m 3 3) (get_el m 2 1) (get_el m 1 2))
    )
  )
)

(determinant '())