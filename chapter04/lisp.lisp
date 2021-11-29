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
