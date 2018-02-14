#lang racket

(define (quick_sort a)
  (if (empty? a)
    a
    (let ([pivot (car a)])
      (let ([t (cdr a)])
        (let ([left (filter (lambda (x) (< x pivot)) t)])
          (let ([right (filter (lambda (x) (>= x pivot)) t)])
            (append (quick_sort left) (list pivot) (quick_sort right))
          )
        )
      )
    )
  )
)

(define (matrix_mult m1 m2)
 (0)
)

(define (table_summary t)
  
)