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

;; === sum ===

(define (rowSum row)
  (if (null? row)
      0
      (+ (car row) (rowSum (cdr row)))
   )
)

(define (sum mat)
  (if (null? mat)
      0
      (+ (rowSum (car mat)) (sum (cdr mat)))
   )
)

(display "=== sum ===\n")
(sum '((1 2 3) (4 5 6) (7 8 9))) ;; 45
(sum '((1 2) (30 40) (5 6) (70 80))) ;; 234
(sum '((8 9 5 6 7) (3 4 5 4 2))) ;; 53

;; === complete? ===

(define (_complete? adj size)
  (if (null? adj)
      #t
      (if (= (length (car adj)) size)
          (_complete? (cdr adj) size)
          #f
      )
   )
)

(define (complete? graph)
  (_complete? graph (length graph))
)

(display "=== complete? ===\n")
(complete? '((a b c) (b a c) (c a b) (d e) (e d))) ;; #f
(complete? '((a b) (b a))) ;; #t
(complete? '( (a c) (b a) (c a))) ;; #f

;; === msort ===

(define (uniteOneEl single arr)
      (if (< (car single) (car arr))
          (cons (car single) arr)
          (if (null? (cdr arr))
               (append arr single)
               (cons (car arr) (uniteOneEl single (cdr arr))) 
          )
      )
)

 
(define (unite arr1 arr2)
  (cond
    ((and (null? arr1) (null? arr2)) arr1) ;si ambos estan vacios 
    ((null? arr1) arr2) ;si arr1 esta vacio
    ((null? arr2) arr1) ;si arr2 esta vacio
    ((and (= 1 (length arr1)) (= 1 (length arr2))) ;si ambos tienen solo 1 elemento
       (if (< (car arr1) (car arr2))
            (cons (car arr1) arr2)
            (cons (car arr2) arr1)
       )
    )
    ((= 1 (length arr1)) ;si solo arr1 tiene un solo elemento
        (uniteOneEl arr1 arr2)
    )
    ((= 1 (length arr2)) ;si solo arr2 tiene un solo elemento
        (uniteOneEl arr2 arr1)
    )
    (else  ;si ambos tienen elementos
        (if (< (car arr1) (car arr2))
          (cons (car arr1) (unite (cdr arr1) arr2))
          (cons (car arr2) (unite (cdr arr2) arr1)) 
        ) 
    )
  )
)

(define (msort arr)
  (if (null? arr)
      arr
      (if (= 1 (length arr))
          arr
          (if (even? (length arr))
              (unite (msort (take arr (/ (length arr) 2))) (msort(drop arr (/ (length arr) 2))))
              (unite (msort (take arr (/ (- (length arr) 1) 2))) (msort (drop arr (/ (- (length arr) 1) 2))))
           )
      )
   )
)

(display "=== msort ===\n")
(msort '()) ;; '()
(msort '(1)) ;; '(1)
(msort '(10 35 8 2.6 4.7 12)) ;; '(2.6 4.7 8 10 12 35)
(msort '(1 4 7 9 3 4 8 10)) ;; '(1 3 4 4 7 8 9 10)

;; === sold-units ===

;; This should not be done! (but it helps)
(define sales 
  '(
    (105 (10 3) (4 2) (9 3))
    (106 (6 4) (8 1) (4 6))
    (107 (9 7) (12 1) (14 1) (10 4))
    (108 (4 1))
    (109 (7 21) (10 4) (14 6) (5 3))
  )
)

(define (sumOnPairs id pairs)
   (if (null? pairs)
      0
      (if (= id (caar pairs))
          (cadar pairs)
          (sumOnPairs id (cdr pairs))
      )
   )
 
)

(define (sold-units id sales)
  (if (null? sales)
      0
      (+ (sold-units id (cdr sales)) (sumOnPairs id (cdar sales)))
  )
)

(display "=== sold-units ===\n")
(sold-units 2 sales) ;; 0
(sold-units 9 sales) ;; 10
(sold-units 10 sales) ;; 11
(sold-units 14 sales) ;; 7

;; === insert ===

(define (insert x tree)
  (if (null? tree)
      (cons x '(() ()))
      (if (< x (car tree)) ; x < car?
          (list (car tree) (insert x (cadr tree)) (caddr tree)) ;metelo a la izq
          (list (car tree) (cadr tree) (insert x (caddr tree))) ;metelo a la der
      )
   )
)

(display "=== insert ===\n")
(insert 1 '()) ;; '(1 () ())
(insert 3 '(1 () (5 () ()))) ;; '(1 () (5 (3 () ()) ()))
(insert 0 '(1 () (5 (3 () ()) (6 () ())))) ;; '(1 (0 () ()) (5 (3 () ()) (6 () ())))


;; == set ===
(define (isRepeated? i lst)
  (if (null? lst)
      #t
      (if (number? (car lst))
          (if (= i (car lst))
              #f
              (isRepeated? i (cdr lst))
          )
          (isRepeated? i (cdr lst))
      )
   )
)
 
(define (set lst)
  (if (null? lst)
      null
      (if (list? (car lst))
          (set (cdr lst))
          (if (number? (car lst))
              (if (isRepeated? (car lst) (cdr lst))
                  (cons (car lst) (set (cdr lst)))
                  (set (cdr lst))
                  )
              (set (cdr lst))
           )
      ) 
  )
)

(display "=== set ===\n")
(set '(1 2 3 2 4 a (1 2) 5 2 3)) ;; '(1 4 5 2 3)
(set '(a b 3 4)) ;; '(3 4)
(set '(10 (a b 3) 4 (8) c d (a b 3) d c 11)) ;; '(10 4 11)

(define (format arr)
  (if (null? arr)
      null
      (if (number? (car arr))
           (cons (car arr) (format (cdr arr)))
           (format (cdr arr))
      )
   )
)

(define (uniteSorted x y)
  (cond
    ((and (null? x) (null? y)) x)
    ((null? x) y)
    ((null? y) x)
    ((= (car x) (car y)) (uniteSorted (cdr x) y))
    (else  ;si ambos tienen elementos diferente
      (if (< (car x) (car y))
          (cons (car x) (uniteSorted (cdr x) y))
          (cons (car y) (uniteSorted (cdr y) x)) 
        ) 
     )
  )
)

(define (union x y)
  (uniteSorted (msort(format x)) (msort(format y)))
)

(display "=== union ===\n")
(union '(1 2 3 4) '(3 4 5 6)) ;; '(1 2 3 4 5 6)
(union '(10 2 8 4) '()) ;; '(10 2 8 4)
(union '(2 a 8 4) '(b c d)) ;; '(2 8 4)

(define (intersect x y)
  (if (null? x)
     x
     (if (isRepeated? (car x) y)
         (intersect (cdr x) y)
         (cons (car x) (intersect (cdr x) y))
     )
  )
)

(define (intersection x y)
  (if (or (null? x) (null? y))
      null
      (intersect (msort(format x)) (msort(format y)))
  )
)

(display "=== intersection ===\n")
(intersection '(1 2 3 4) '(3 4 5 6)) ;; '(3 4)
(intersection '(10 2 8 4) '()) ;; '()
(intersection '(2 a 8 4) '(b c 8 d)) ;; '(8)
