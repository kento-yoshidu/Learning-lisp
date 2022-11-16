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

(print (eq '() nil))
(print (eq '() ()))
(print (eq '() 'nil))
