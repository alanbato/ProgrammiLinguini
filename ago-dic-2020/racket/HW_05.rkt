#lang racket
;; Roberta González A01570010
;; ====================
;; Complete the following functions and submit your file to Canvas.
;; ====================
;; Do not change the names of the functions. 
;; Do not change the number of arguments in the functions.
;; If your file cannot be loaded by the Racket interpreted, your submission may be cancelled. Then, submit only code that works.
;; ====================
;; Grading instructions:
;; There is a series of test cases for each function. In order to state that your function "works as described", your output must be similar to the expected one in each case.

;; === fibonacci ===

(define (fibonacci n)
  (if (= n 0)
      0
      (if (= n 1)
          1
          (+ (fibonacci (- n 1)) (fibonacci (- n 2)))
       )
   )
)

;(display "=== fibonacci ===\n")
;(fibonacci 10) ;; 55
;(fibonacci 15) ;; 610
;(fibonacci 20) ;; 6765

;; === nestedSum ===

(define (nestedSum lst)
  (if (null? lst)
        0
        (if (list? (car lst))
            (+ (nestedSum(car lst)) (nestedSum(cdr lst)))
            (+ (car lst) (nestedSum(cdr lst)))
        )
   )
)

;(display "=== nestedSum ===\n")
;(nestedSum '(10 20 30 40)) ;; 100 
;(nestedSum '(15 (5 4 (3 10)) 6 (8))) ;; 51
;(nestedSum '(((20 () ()) () 3))) ;; 23

;; === evenNumbers ===

(define (evenNumbers lst)
  (if (null? lst) ;si se acabo
      null       ;regresa null
      (if (list? (car lst)) ;si no se acabo y es una lista
          (cons (evenNumbers (car lst)) (evenNumbers (cdr lst))) ;llama a la funcion con esa lista
          (if (even? (car lst)) ;si no es una lista y el primero es par
              (cons (car lst) (evenNumbers (cdr lst))) ;junta el primero con los demas de la lista
              (evenNumbers (cdr lst)) ;si no es par, no juntes el primero, solo los demas de la lista
           )
       )
    )
)

(display "=== evenNumbers ===\n")
(evenNumbers '(10 3 25 32 37 9)) ;; '(10 32) 
(evenNumbers '(15 (5 4 (3 10)) 6 (8))) ;; '((4 (10)) 6 (8))
(evenNumbers '(((20 () ()) () 3))) ;; '(((20 () ()) ()))

;; === nestedReverse ===

(define (nestedReverse lst)
  (if (null? lst)
      null
      (if (list? (car lst))
          (append (nestedReverse (cdr lst)) (list(nestedReverse (car lst))))
          (append (nestedReverse (cdr lst)) (list (car lst))) ;el first element se va al final, reverseas lo demas
       )
    )
)

(display "=== nestedReverse ===\n")
(nestedReverse '(10 3 25 32 37 9)) ;; '(9 37 32 25 3 10)
(nestedReverse '(15 (5 4 (3 10)) 6 (8))) ;; '((8) 6 ((10 3) 4 5) 15)
(nestedReverse '(((20 () ()) () 3))) ;; '((3 () (() () 20)))

;; === unroll ===

(define (unroll lst)
  (if (null? lst)
      null
      (if (list? (car lst))
          (append (unroll (car lst)) (unroll (cdr lst)))
          (cons (car lst) (unroll (cdr lst))) ;el first element se va al final, reverseas lo demas
       )
    ) 
)

(display "=== unroll ===\n")
(unroll '(10 3 25 32 37 9)) ;; '(10 3 25 32 37 9) 
(unroll '(15 (5 4 (3 10)) 6 (8))) ;; '(15 5 6 3 10 6 8)
(unroll '(((20 () ()) () 3))) ;; '(20 3)
