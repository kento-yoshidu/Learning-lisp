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

;; when

(when (oddp 5)
  (print that is odd)
  (print Bye.)
)

(when (oddp 6)
  ;(print that is odd)
  ;(print Bye.)
)

;; unless

(unless (oddp 5)
  (print that is not odd)
  (print Bye.))

(unless (oddp 6)
  (print that is not odd)
  (print Bye.))

;; cond

(defun FizzBuzz(number)
  (cond
    ((= (rem number 15) 0)
      (print FizzBuzz))
    ((= (rem number 3) 0)
      (print Fizz))
    ((= (rem number 5) 0)
      (print Buzz))
    (t 
      (print number))))

(FizzBuzz '15 )
; FizzBuzz
(FizzBuzz '3)
; Fizz
(FizzBuzz '6)
; Fizz
(FizzBuzz '10)
; Buzz
(FizzBuzz '11)
; 11

;; case

(defun FizzBuzz(number)
  (case (rem number 15)
    (0
      FizzBuzz)
    (3
      Fizz)
    (5
      Buzz)
    (t
      number)))

( print( FizzBuzz 15))
; FizzBuzz
( print( FizzBuzz 3))
; Fizz
( print( FizzBuzz 5))
; Buzz
( print( FizzBuzz 11))
; 11

;; andとor

(print
  (and (oddp 5) (oddp 7) (oddp 9)))
; T

(print
  (and (oddp 5) (oddp 7) (oddp 10)))
; NIL

(print
  (or (oddp 5) (oddp 7) (oddp 10)))
; T

;;; member関数

(print
  (member 4 '(3 4 5 6)))
; (4 5 6)

(print
  (member 1 '(3 4 5 6)))
; NIL

(print
  (find-if #'oddp '(2 4 5 6)))
; 5

(print
  (find-if #'oddp '(2 4 6 8)))
; NIL

(print
  (if (find-if #'oddp '(2 3 4 5))
    "There is odd number"
    "There is no odd number"))
; "There is odd number"

(print
  (if (find-if #'oddp '(2 4 6 8))
    "There is odd number"
    "There is no odd number"))
; "There is no odd number"

;; 比較関数

(defparameter *fruit* 'apple)

(cond
  ((eq *fruit* 'apple)
    (print "This is an aplle"))
  ((eq *fruit* 'orange)
    (print "This is a orange")))
; This is an apple

(print 
  (eq 3.0 3.0))
; NIL

(print
  (equal (list 1 2 3) (list 1 2 3)))
; T

(print
  (equal (list 1 2 3) (list 1 2)))
; NIL

(print
  (equal '(1 2 3) (cons 1 (cons 2 (cons 3 ())))))
; T

(print (equal 'apple 'apple))
; T

(print
  (eq 3.4 3.4))
; NIL

(print
  (eql 3.4 3.4))
; T

; 文字も比較できる?
(print
  (eq #\a #\a))
; T

(print
  (eql #\a #\a))
; T

; リストは比較できない
(print
  (eql (list 1 2 3) (list 1 2 3)))
; NIL  

(print
  (equal "Apple" "apple"))
; NIL

(print
  (equalp "Apple" "apple"))

(print
  (equal 1 1.0))
; NIL

(print
  (equalp 1 1.0))
; T

|#