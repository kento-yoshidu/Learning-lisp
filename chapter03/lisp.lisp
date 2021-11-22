#|
(print (eq 'foo 'Foo))
; T

(print (eq 'foo 'bar))
; NIL

;;;;;;;;;;;;;;;;;;

(print (+ 1.0 10))
; 11.0

(print (expt 2 10))
; 1024

;;;;;;;;;;;;;;;;;;

(print (/ 4 6))
; 2/3

(print (/ 4.0 6))
; 0.6666667

(print (+
    (+(/ 4 6) (/ 1 6))
    1
))

;;;;;;;;;;;;;;;;;;

(princ "This is \"Lisp\"")
; This is "Lisp"

(print
  (expt
    (+ 2 2)
    (+ 4 4)
  )
)
; 65536


(print '(+ 1 3))
; (+ 1 3)

;;;;;;;;;;;;;;;;;;


(print (cons "Hello" "World"))
; ("Hello" . "World")

(print (cons "Bye" nil))
; ("Bye")


(print
  (cons
    '("Hello World")
    '("Let\'s Learning Lisp")
  )
)

(print
  (car '(pork beef chicken))
)
; pork

(print
  (cdr '(pork beef chicken))
)
; (BEEF CHICKEN)

;;;;;;;;;;;;;;;;;;

(print
  (car
    (cdr '(pork beef chicken))
  )
)
; BEEF


(print
  (cadr '(pork beef chicken))
)
; BEEF

;;;;;;;;;;;;;;;;;;

(print
  (list 'pork 'beef 'chicken)
)
; (PORK BEEF CHICKEN)

(print
  (list 'pork
    (list 'beef 'chicken)
  )
)
; (PORK (BEEF CHICKEN))

;;;;;;;;;;;;;;;;;;

|#


(print (car '(pork (beef chicken) cat)))
; PORK

(print (cadr '(pork (beef chicken) cat)))
; (BEEF CHICKEN) 

(print (cddr '(pork (beef chucken) cat)))
; CAT