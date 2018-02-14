#lang racket

(define (quick_sort a)
  (if (empty? a)
    a
    (let ([pivot (car a)])
      (let ([tail (cdr a)])
        (let ([left (filter (lambda (x) (< x pivot)) tail)])
          (let ([right (filter (lambda (x) (>= x pivot)) tail)])
            (append (quick_sort left) (list pivot) (quick_sort right))
          )
        )
      )
    )
  )
)

(define (matrix_mult m1 m2)
  (map (lambda (row) (map (lambda (col) (apply + (map * row col))) (apply map list m2))) m1)
)

(define (get_height_avg g t)
  (let ([fl (filter (lambda (l) (equal? (car l) g)) t)])
    (/ (apply + (map cadr fl)) 
       (exact->inexact (length fl))
    )
  )
)

(define (table_summary t)
  (list (list "Male" (get_height_avg "Male" t)) (list "Female" (get_height_avg "Female" t)))
)

(matrix_mult '((1 2 3) (4 5 6) (7 8 9)) '((1 2 3) (4 5 6) (7 8 9)))