#lang racket
;todas se representan usando lists

;ARRAY
;insertion sort
(define (insert x lst)
  (cond
    ((null? lst) (list x))
    ((< x (car lst)) (cons x lst))
    (else (cons (car lst) (insert x (cdr lst))))
   )
 )

(define (isort lst)
  (if (null? lst)
      null
      (insert (car lst) (isort (cdr lst)))
   )
 )

;MATRIX
;by row       by col
;1 2 3        1 4 7
;4 5 6        2 5 8
;7 8 9        3 6 9
(define (rowSum rA rB)
  (if (null? rA)
      '()
      (cons (+ (car rA) (car rB)) (rowSum (cdr rA) (cdr rB)))
   )
 )

(define (matrixSum matrixA matrixB)
  (if (null? matrixA)
      '()
      (cons
        (rowSum (car matrixA) (car matrixB))
        (matrixSum (cdr matrixA) (cdr matrixB))
       )
   )
)

;LISTS AS RECORDS
;ex:
'((id 123) (name roby) (lastname gzz) (grade 90))

;table  = list of records
'(
  ((id 1) (name roby) (lastname gzz) (grade 90))
  ((id 2) (name bobs) (lastname vzz) (grade 92))
  ((id 3) (name boby) (lastname glz) (grade 94))
 )

;STACKS
(define (push x stack) ;adds elements
  (cons x stack) ;cons puts in the first place
)

(define (pop stack) ;removes element
  (cdr stack)
)

(define (peek stack) ;sees the first eelement, doesnt remove it
  (car stack)
)

;QUEUE
(define (add x queue) ;adds elements
  (append queue (list x)) ;you append the last element you converted into a list  (append takes two lists)
)

(define (remove queue) ;remmoves element
  (cdr queue)
)

(define (first queue) ;sees the first eelement, doesnt remove it
  (car queue)
)