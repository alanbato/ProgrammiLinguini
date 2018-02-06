#lang racket

(define (even-list listy)
    (if (even? (length listy)) 
        (car listy)
        (car (reverse listy))
        )
)

(even-list (list 1 2 3 4))
(even-list (list 1 2 3 4 5))

(define (return-third listy)
    (if (and (not (null? listy))
         (> (length listy) 3))
     (list-ref listy 2)
     '()
    )
)

(return-third (list 1 2 3 4 5))
(return-third (list 1 2))

(define (three-list arga argi argo)
    (list arga argi argo)
)

(three-list 1 2 3)
(three-list 'a 'b 'c)

(define (palindrome? str)
    (cond
    [(zero? (string-length str)) #t]
    [(= (string-length str) 1) #t]
    [#t (let ((listy (string->list str)))
            (let ((first (car listy))
                  (last (car (reverse listy))))
                (and (char=? first last)
                     (palindrome?
                          (substring (list->string listy)
                          1 (- (length listy) 1))))))
    ]
    ))

(define (fast-palindrome? str)
    (equal? (string->list str) (reverse (string->list str))
    )
)

(palindrome? "Barragan")
(fast-palindrome? "Hola")
(fast-palindrome? "abba")
(fast-palindrome? "tacocat")
(palindrome? "anitalavalatina")


(define (odd-list listy new_list)
  (let ((index 0) (c car (listy)))
  (odd-list (listy ))
  )
)