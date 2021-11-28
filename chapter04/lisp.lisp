;;; if文

#|
(print (
  if '()
    'i-am-true
    'i-am-false))
; I-AM-FALSE

(print (
  if '(1)
    'i-am-true
    'i-am-false))
; I-AM-TRUE

(print (
  if '(nil)
    'i-am-true
    'i-am-false))
; I-AM-TRUE

(defun my-length (list)
  (if list
    (1+ ( my-length (cdr list)))
    0))

(print
  ( my-length '(list with four symbols)))
; 4

(print (eq '() nil)) ;T
(print (eq '() ())) ;T
(print (eq '() 'nil)) ;T

(print 
  (if (= (+ 1 2) 3)
    'yup
    'nope))
; YUP

(print
  (if (= (+ 1 2) 4)
    'yup
    'nope))
; NOPE

(let ((a 1))
  (if a
    (print a)
    (print 'empty)))
; 1

(let ((list '()))
  (if list
    (print list)
    (print 'empty)))
; EMPTY

(let ((a 7)) 
  (if (= (rem a 2) 0)
    (print 'even)
    (print 'odd)))
; ODD

(defvar *number-was-odd* nil)

(if (oddp 7)
  (progn (setf *number-was-odd* t)
    'odd-number)
  'even-number)

(print *number-was-odd*)
