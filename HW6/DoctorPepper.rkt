#lang racket
(define (quicksort lst)
  (if (null? lst)
    '()
    (let ((pivot (car lst))
          (rest (cdr lst)))
      (append
        (quicksort (filter (lambda (x) (< x pivot)) rest))
        (cons pivot 
          (quicksort (filter (lambda (x) (> x pivot)) rest))
        )
      )
    )
  )
)

(define (transpose mat)
  (if (null? (car mat))
    '()
    (cons (map car mat) (transpose (map cdr mat)))
  )
)

(define (row-mul row row2)
  (apply + (map * row row2))
)

(define (row-mat row mat)
  (map
    (lambda (row2)
      (row-mul row row2))
    mat
  )
)

(define (mat-mul m1 m2)
  (map
    (lambda (row)
      (row-mat row (transpose m2)))
    m1
  )
)

(define (mean-heights tbl)
  (list (caar tbl) (/ (apply + (map cadr tbl)) (length tbl)))
)

(define (summarize tbl)
  (list
    (mean-heights (filter (lambda (x)
                            (equal? "Male" (car x)))
                           tbl))
    (mean-heights (filter (lambda (x)
                            (equal? "Female" (car x)))
                           tbl))
  )
)

(define (insert x tree)
  (cond
    [(null? tree) (list x '() '())]
    [(< x (car tree))
      (list
        (car tree)
        (insert x (cadr tree))
        (caddr tree)
      )]
    [(> x (car tree))
      (list
        (car tree)
        (cadr tree)
        (insert x (caddr tree))
      )]
    [else tree]
  )
)

(define (get-paths node gph)
  (filter (lambda (x) (equal? (car x) node)) gph)
)

(define (walk-paths paths gph)
  ; ((A B)) -> ((B C) (B F))
  (apply append
    (filter
      (lambda (x) (not (null? x)))
      (map (lambda (n) (get-paths n gph))
          (map cadr paths))
    )
  )
)

(define (path-helper paths dest gph)
  (cond
    [(null? paths) #f]
    [(ormap (lambda (x) (equal? (cadr x) dest)) paths) #t]
    [else (path-helper 
            (walk-paths paths gph)
            dest
            gph
          )
    ]
  )
)

(define (path? n1 n2 gph)
  (path-helper (get-paths n1 gph) n2 gph)
)

(path? "A" "Z" '(("A" "B") ("C" "G") ("B" "C") ("B" "F") ("F" "Z")))