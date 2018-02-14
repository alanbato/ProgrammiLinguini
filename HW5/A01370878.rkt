#lang racket

;; Complete the following functions and submit your file to Blackboard.

;; ========= IMPORTANT ==========
;; Change the name of the file so that it contains your student ID or name.
;; Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
;; Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
;; Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
;; If your file cannot be loaded by the Racket interpreted, your grade will be zero. Then, submit only code that works.

(define (myReverse x)
  (if (null? x)
    '()
    (append (myReverse (cdr x)) (list (car x)))
  )
)

(define (myMeanHelper l accum)
  (if (null? l)
    accum
    (myMeanHelper (cdr l) (+ (car l) accum))
  )
)

(define (myMean x)
  (if (null? x)
    "Error"
    ( / (myMeanHelper x 0) (length x))
  )
)

(define (fibonacci n)
  (if (< n 2)
    n
    (+ (fibonacci (- n 1))
       (fibonacci (- n 2))
    )
  )
)

(define (sum-helper x accum)
  (cond
  [(null? x) accum]
  [(list? (car x)) (sum-helper (cdr x) accum)]
  [else (sum-helper (cdr x) (+ (car x) accum))]
  )
)

(define (sum x)
  (sum-helper x 0)
)

(define (nested-sum-helper x accum)
  (cond
  [(null? x) accum]
  [(list? (car x)) (nested-sum-helper (cdr x) (nested-sum-helper (car x) accum))]
  [else (nested-sum-helper (cdr x) (+ (car x) accum))]
  )
)

(define (nestedSum x)
  (nested-sum-helper x 0)
)

(define (removeNestedLists x)
  (if (null? x)
    x
    (if (list? (car x))
      (append (removeNestedLists (car x)) (removeNestedLists (cdr x)))
      (cons (car x) (removeNestedLists(cdr x)))
    )
  )
)