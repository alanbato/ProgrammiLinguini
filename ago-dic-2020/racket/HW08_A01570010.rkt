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

;; === maskedsum ===

(define (maskedSum lst mask)
  (if (null? lst)
      0
      (if (car mask)
          (+ (car lst) (maskedSum (cdr lst) (cdr mask)))
          (maskedSum (cdr lst) (cdr mask))
      )
   )
)

(display "=== maskedsum ===\n")
(maskedSum '(1 2 3 4 5 6) '(#t #f #f #t #f #t)) ;; 11
(maskedSum '(1 2 3 4 5 6) '(#f #t #f #t #f #f)) ;; 6
(maskedSum '(1 2 3 4 5 6) '(#t #t #t #t #t #t)) ;; 21

;; === shift ===

(define (zeros n)
  (if (= n 0)
      null
      (cons 0 (zeros (- n 1)))
  )
)

(define (shift lst n)
  (if (positive? n)
      (append (zeros n) lst)
      (append lst (zeros (abs n)))
   )
)

(display "=== shift ===\n")
(shift '(3 5 0 0 2) 3) ;; '(0 0 0 3 5 0 0 2)
(shift '(19 4 50 10 2) -2) ;; '(19 4 50 10 2 0 0)

;; === list2matrix ===
(define (l2m lst r c)
  (if (null? lst)
      lst
      (cons (take lst c) (l2m (drop lst c) r c))
  )
)

(define (list2matrix lst r c)
  (if (< (length lst) (* r c))
      lst
      (l2m lst r c)
  )
)

(display "=== list2matrix ===\n")
(list2matrix '(10 20 30 40 50 60) 2 3) ;; '((10 20 30) (40 50 60))
(list2matrix '(10 20 30 40 50 60) 3 2) ;; '((10 20) (30 40) (50 60))
(list2matrix '(10 20 30 40 50 60) 3 3) ;; '(10 20 30 40 50 60)

;; === myFilter ===

(define (myFilter f x)
  (if (null? x)
      null
      (if (f (car x))
          (cons (car x) (myFilter f (cdr x)))
          (myFilter f (cdr x))
      )
  )
)

(display "=== myFilter ===\n")
(myFilter (lambda (x) (> x 2)) '(1 2 0 3 4 1 2 9)) ;; '(3 4 9)
(myFilter (lambda (x) (= x 2)) '(1 2 0 3 4 1 2 9)) ;; '(2 2)
(myFilter (lambda (x) (= (remainder x 2) 0)) '(1 2 0 3 4 1 2 9)) ;; '(2 0 4 2)

;; === swap ===

(define (swap i j lst)
  (if (= (- j i) 1) ;si están juntos
        (append (take lst i) (list(list-ref lst j)) (list(list-ref lst i)) (drop lst (+ j 1)))
        (  if (= (- j i) 2) ;si los separa un elemento
              (append (take lst i) (list(list-ref lst j)) (list(list-ref lst (+ i 1))) (list(list-ref lst i)) (drop lst (+ j 1)))
              (append (take lst i) (list(list-ref lst j)) (take (drop lst (+ i 1)) (- j 1)) (list(list-ref lst i)) (drop lst (+ j 1))) ;si los separan mas de un elemento
        )     
    )
)

(display "=== swap ===\n")
(swap 4 5 '(a b c d e f)) ;; '(a b c d f e)
(swap 1 3 '(10 20 30 40)) ;; '(10 40 30 20)
(swap 0 4 '(a b c d (e) f)) ;; '((e) b c d a f)

;; === evaluate ===

(define (evaluateWithIndex coef x i)
  (if (null? coef)
      0
      (+ (* (car coef) (expt x i)) (evaluateWithIndex (cdr coef) x (+ i 1)))
  )
) 

(define (evaluate coef x)
  (evaluateWithIndex (reverse coef) x 0)
)

(display "=== evaluate ===\n")
(evaluate '() 100) ;; 0
(evaluate '(2 3.1 10 0) 2) ;; 48.4
(evaluate '(10 0) 2) ;; 20
(evaluate '(1 2 3 4 5) 3) ;; 179

;; === ackermann ===

(define (ackermann m n)
  (if (= m 0)
      (+ n 1)
      (if (= n 0) 
          (ackermann (- m 1) 1)
          (ackermann (- m 1) (ackermann m (- n 1)))
      )
  )
)

(display "=== ackermann ===\n")
(ackermann 2 2) ;; 7
(ackermann 2 5) ;; 13
(ackermann 3 1) ;; 13
(ackermann 3 8) ;; 2045

;; === select ===

;; This should not be done! (but it helps)
(define table '(
  ((name "Charles") (age 24))
  ((age 23) (name "Mary") (lastName "Danvers") (gender "female"))
  ((name "Caroline") (lastName "Ortiz") (age 19))
  )
)

(define (selectRow row key)
  (if (null? row)
      row
      (if (eq? (caar row) key)
          (cdr(car row))
          (selectRow (cdr row) key)
       )
   )
)

(define (selectAux table key)
  (if (null? table)
      table
      (if (null? (selectRow (car table) key))
          (selectAux (cdr table) key)
          (cons (selectRow (car table) key) (selectAux (cdr table) key))
      )
   ) 
)

(define (select table key)
  (flatten (cons key (selectAux table key)))
)

(display "=== select ===\n")
(select table 'age) ;; '(age 24 23 19)
(select table 'phone) ;; '(phone)
(select table 'lastName) ;; '(lastName "Danvers" "Ortiz")