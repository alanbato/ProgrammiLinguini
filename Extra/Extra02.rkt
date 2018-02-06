#lang racket

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

(define (count-digits l)
  (apply + (map string-length (map number->string l)))
)

(define (advanced-mean x)
  (display "Not Implemented")
)

(define (curried-do-smt x)
  (lambda (y z) (- (+ (* x y) z) 1 ))
)

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

(define (to_bool x) (if (equal? x 1) #t #f))
(define (to_int x) (if x 1 0))
(define (boolean_ops x y)
  (map (lambda (a b) (to_int (or (to_bool a) (to_bool b)))) x y)
)

(define (list->number x)
  (string->number (apply string-append (map number->string x)))
)

(define (complete-graphs x)
  (display "Not Implemented")
)

(define (sum-matrix-helper x accum)
  (if (null? x)
    accum
    (sum-matrix-helper (cdr x) (+ (apply + (car x)) accum))
  )
)

(define (sum-matrix x)
  (sum-matrix-helper x 0)
)

