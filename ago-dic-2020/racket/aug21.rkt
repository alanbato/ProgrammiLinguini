 #lang racket
(define x'(1 2 3 4 5)) ;las listas son heterogeneas, pueden ser de cualquier valor
; car - primero de la lista
; cdr - Resto de la lista (devuelve lista)
(car x) ;car no modifica la lista
(cdr x)
;estos dos de abajo son equivalentes
(car (cdr (cdr x)))
(caddr x)

;puedo tener listas de lista
(car '(#T #F (1 2 3 4) #T))

;como jala el null
(null? '(1 2 3 4))
(null? '())

;def de funcion
(define (sumAll l)
  (if (null? l)                     ;condicion
        0                           ;then
        (+ (car l) (sumAll(cdr l))) ;else
   )
  ;no hay return pq lo último en ejecutarse el lo que devuelve
)
;usando la funcion
(sumAll x)

;que me de el elemento i (sin validacion)
(define (get lst i)
  (if (= i 0) ;el = funciona como un equal, equal tmb jala
      (car lst)
      (get (cdr lst) (- i 1))
  )
)
(get '(a b c d e) 3)


;que me de el elemento i (validado)
(define (getV lst i)
  (cond ;le dices que le mandaras una lista de casos, y lo que se hace
    ((= (length lst) 0) "adios tonta")
    ;((null? lst) null)
    ((= i 0) (car lst)) ;condicion accion
    (else (getV (cdr lst) (- i 1))) ;else es caso default
  )
)
(getV '(a b c d e) 7)
