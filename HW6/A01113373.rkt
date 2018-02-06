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

(define (myMean x)
  (display "Not yet implemented.")	
)

(define (fibonacci n)
  (display "Not yet implemented.")		
)

(define (sum x)
  (display "Not yet implemented.")		
)

(define (nestedSum x)
  (display "Not yet implemented.")		
)

(define (removeNestedLists x)
  (display "Not yet implemented.")		
)