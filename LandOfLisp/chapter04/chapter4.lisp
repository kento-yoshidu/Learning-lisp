; false
(print (if '()
    'ture
    'false))

; 空リスト()がfalseなので再帰しやすい

(defun rec (list)
    (print list)
    (if list
        (1+ (rec(cdr list)))
        0))

(print (rec '(I LOVE LISP)))
#|
(I LOVE LISP) 
(LOVE LISP) 
(LISP) 
NIL 
3 
|#

; 全てT(True)
(print (eq '() nil))
(print (eq '() ()))
(print (eq '() 'nil))

(print
    (if (= (+ 1 2) 3)
        '=
        '!=))
;=> =

(print
    (if (= (+ 1 2) (- 4 1))
        '=
        '!=))
;=> =

(print
    (if (= (+ 1 3) (car '(4 1)))
        '=
        '!=))
;=> =

(print
    (if (oddp 5)
        'odd))
;=> ODD
;=> 奇数ならNILが返る

;=> 1つの式しか評価しない
(print
    (if (oddp 5)
        'odd
        (1 / 0)))
;=> ODD

