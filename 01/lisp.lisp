#|
(format t "Hello Lisp")
; Hello Lisp

(print "Hello Lisp")
; "Hello Lisp"

(defparameter *small* 1)
  (print *small*)
  ; 1

(defparameter *small* 1)
	(print *small*)
	; 1

(defparameter *small* 3)
	(print *small*)
	; 3

(defvar *small* 1)
	(print *small*)
	; 1

(defvar *small* 3)
	(print *small*)
	; 1

(defun function_name (arg))

(defun test_func (arg)
  (print
    (concatenate 'string arg "!!!")
  )
)

(test_func "Hello World")
; "Hello World!!!"

(defparameter *small* 3)
(defparameter *big* 10)

(defun guess-my-number ()
  (ash (+ *small* *big*) -1)
)

(print
  (guess-my-number)
)
; 6
|#

(defparameter *small* 1)
(defparameter *big* 100)

(defun guess-my-number ()
  (ash (+ *small* *big*) -1)
)

(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number)
)

(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number)
)

(print (smaller))
; 25

(print (bigger))
; 37

(print (smaller))
; 31