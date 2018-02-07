#lang racket

;;; (by (and '("Alan" "Velasco" "A01113373") '("Enrique" "Barragan" "A01370878")))

;;; Prime Numbers
(define (prime-helper x y)
  (cond
    [(= y 1) #t]
    [(= (remainder x y) 0) #f]
    [else (prime-helper x (- y 1))]
  )
)

(define (prime? x)
  (if (= x 1)
    #t
    (prime-helper x (- x 1))
  )
)

;;; Count of digits
(define (count-digits l)
  (apply + (map string-length (map number->string l)))
)

;;; Advanced Mean
(define (advanced-mean-helper x l)
    (cond
      [(zero? x)
        (display "The values introduced are: ")
        (display l)
        (display "\n")
        (display "Their mean is: ")
        (display (/ (apply + l) (length l)))
        (display "\n")]
      [else (advanced-mean (cons x l))]
  )
)

(define (advanced-mean l)
  (display "Introduce one number: ")
  (advanced-mean-helper (read) l)
)

;;; Currying
(define (curried-do-smt x)
  (lambda (y z) (- (+ (* x y) z) 1 ))
)

;;; Merging Two Sorted Lists
(define (merge x y)
  (cond
   [(null? x) y]
   [(null? y) x]
   [else
    (if (< (car x) (car y))
      (cons (car x) (merge (cdr x) y))
      (cons (car y) (merge (cdr y) x))
    )
   ]
  )
)

;;; Boolean Operations
(define (to_bool x) (if (equal? x 1) #t #f))
(define (to_int x) (if x 1 0))
(define (boolean_ops x y)
  (map (lambda (a b) (to_int (or (to_bool a) (to_bool b)))) x y)
)

;;; List to Number
(define (list->number x)
  (string->number (apply string-append (map number->string x)))
)

;;; Complete Graphs
(define (in-all-edges? x y)
  (cond ; An OR could be here, but we want to return a bool so we use cond
    [(null? y) #t] ; Last call is not important
    [(and (member x (car y)) (in-all-edges? x (cdr y))) #t]
    [else #f]
  )
)

(define (complete-graphs x)
  (cond 
    [(null? x) #f]
    [(null? (cdr x)) #f]
    [(null? (car x)) #t] ; Last call is not important
    [else (and
            (in-all-edges? (caar x) (cdr x))
            (complete-graphs (cons (cdar x) (cdr x))))]
  )
)

;;; Sum of matrix elements
(define (sum-matrix-helper x accum)
  (if (null? x)
    accum
    (sum-matrix-helper (cdr x) (+ (apply + (car x)) accum))
  )
)

(define (sum-matrix x)
  (sum-matrix-helper x 0)
)