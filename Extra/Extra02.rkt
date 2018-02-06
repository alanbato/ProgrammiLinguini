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

(define (sum-digits x)
  (display "Not Implemented")
)

(define (advanced-mean x)
  (display "Not Implemented")
)

(define (curried-do-smt x)
  (display "Not Implemented")
)

(define (merge x)
  (display "Not Implemented")
)

(define (list->number x)
  (display "Not Implemented")
)

(define (complete-graphs x)
  (display "Not Implemented")
)
(define (sum-matrix x)
  (display "Not Implemented")
)