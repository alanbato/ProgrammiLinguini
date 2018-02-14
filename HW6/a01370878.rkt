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

(define (insert el t)
  (cond
    [(null? t) (list el '() '())]
    [(< el (car t))
      (list
        (car t)
        (insert el (cadr t))
        (caddr t)
      )]
    [(> el (car t))
      (list
        (car t)
        (cadr t)
        (insert el (caddr t))
      )]
    [else t]
  )
)

(define (path-getter node graph)
  (filter (lambda (el) (equal? (car el) node)) graph)
)

(define (path-walker paths graph)
  (apply append
    (filter
      (lambda (x) (not (null? x)))
      (map (lambda (n) (path-getter n graph))
           (map cadr paths))
    )
  )
)

(define (path-helper paths dest graph)
  (cond
    [(null? paths) #f]
    [(ormap (lambda (x) (equal? (cadr x) dest)) paths) #t]
    [else (path-helper 
            (path-walker paths graph)
            dest
            graph
          )
    ]
  )
)

(define (path? node1 node2 graph)
  (path-helper (path-getter node1 graph) node2 graph)
)

; The graph is represented by arcs
(path? "X" "M" '(("X" "T") ("C" "G") ("T" "C") ("T" "F") ("F" "M")))