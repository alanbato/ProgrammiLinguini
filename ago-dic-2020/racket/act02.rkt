#lang racket
;cons = inserta un elemento a una lista, si hago lista1 con lista2, la lista1 sera la 1era pos,
   ;no fusiona las listas 
;append = juntas dos listas, si las fusiona
;list = es raro


;get the elements in an odd position
(define b'(0 1 2 3 4 5 6 7 8))

(define (oddPositionsAux lst x)
  (if (null? lst)
      null
      (if (equal? #t x) ;si si lo debes de poner
          (cons (car lst) (oddPositionsAux (cdr lst) #f)) ;anexalo, el sig no jala es entonces #f
          (oddPositionsAux (cdr lst) #t);no lo anexas entonces solo mandas la funcion con un #t
      )
   )
)

(define (oddPositions lst)
  (oddPositionsAux lst #f) ;le mandas f pq 0 no es par
)

(oddPositions b)

;Acceses the i element of a list
(define a'(0 1 2 3 4 5 6 7 8))

(define (getElement lst el i)
   (if (null? lst) ;si se me acabo la lista
       null         ;out of bounds, regresa null
       (if (= el i) ;si aun hay lista, si el elemento que busco, es igual en el que voy
           (car lst) ;regresa ese
           (getElement(cdr lst) el (+ i 1))  ;si no, manda lo que queda de la lista, mismo que buscas, sumale uno en el que vas
       )
    ) 
)

(define (get lst index)
  (if (or (null? lst) (< index 0))
      null ;tmb puedes regresar lst pq está null anyways
      (if (= index 0)
          (car lst)
          (get (cdr lst) (- index 1))
      )
   )
)
 
(getElement a 6 0)
(get a 9)

;reverse a list
(define z'(a b c e f 1 2 3))

(define (myReverse lst)
  (if (null? lst)
      null
      (append (myReverse (cdr lst)) (list (car lst))) ;el first element se va al final, reverseas lo demas
   )                                 ;usas el list pq el append junta dos listas, y el car lst no es una lista
)

(myReverse z)

;palindrome?
(define y'(a b c b a))

( define (palindrome? lst)
   (equal? lst (reverse lst)) ;se usa equal pq ese compares contents, =  solo jala en numeros
)

(palindrome? y)

;sumAll
(define x'(1 2 3 4 5 a b c 5))

(define (sumAll l)
  (if (null? l)
        0
        (if (number? (car l))
            (+ (car l) (sumAll(cdr l)))
            (sumAll(cdr l)))
   )
)

(sumAll x)