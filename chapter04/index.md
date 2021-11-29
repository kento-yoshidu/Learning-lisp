# 条件と判断

## nilと()

空のリスト`'()`は偽として扱われる。再帰を扱いやすくなる。

```lisp
(print (
  if '()
    'i-am-true
    'i-am-false
))
; I-AM-FALSE

(print (
  if '(1)
    'i-am-true
    'i-am-false
))
; I-AM-TRUE

(print (
  if '(nil)
    'i-am-true
    'i-am-false
))
; I-AM-TRUE
```

空リストこそがCommon Lispにおいて唯一の偽であり、空リストは4つの書き方がある。

```lisp
(print (eq '() nil)) ;T
(print (eq '() ())) ;T
(print (eq '() 'nil)) ;T
```


## if文

```lisp
(print 
  (if (= (+ 1 2) 3)
    'yup
    'nope
  )
)
; YUP

(print
  (if (= (+ 1 2) 4)
    'yup
    'nope
  )
)
; NOPE
```

```lisp
(
  let ((a 7)) 
  (if (= (rem a 2) 0)
    (print 'even)
    (print 'odd)
  )
)
; ODD
```

空リストは偽となるので、リストが空かどうかも調べられる。

```lisp
(
  let ((a 1))
  (if a
    (print a)
    (print 'empty)
  )
)
; 1

(
  let ((list '()))
  (if list
    (print list)
    (print 'empty))
)
; EMPTY
```


グローバル変数の書き換え。`oddp`で奇数判定を行う。

```lisp
(defvar *number-was-odd* nil)

(if (oddp 7)
  (progn (setf *number-was-odd* t)
    'odd-number)
  'even-number
)

(print *number-was-odd*)
```

## when

`when`なら条件式が真のとき、複数の処理を行える。偽の時の処理は指定でいきない(`nil`が返る)。

```lisp
(when (oddp 5)
  (print "that is odd"))
; "that is odd"
; "Bye."

(when (oddp 6)
  (print "that is odd")
  (print "Bye.")
)
; 何も表示されない
```

## unless

`when`の逆。

```lisp
(unless (oddp 5)
  (print "that is not odd")
  (print "Bye.")
)
; 何も表示されない

(unless (oddp 6)
  (print "that is not odd")
  (print "Bye.")
)
; "that is not odd"
; "Bye."
```

## cond

```lisp
(defun FizzBuzz(number)
  (cond
    ((= (rem number 15) 0)
      (print "FizzBuzz"))
    ((= (rem number 3) 0)
      (print "Fizz"))
    ((= (rem number 5) 0)
      (print "Buzz"))
    (t 
      (print number)
    )
  )
)

(FizzBuzz '15 )
; FizzBuzz
(FizzBuzz '3)
; Fizz
(FizzBuzz '6)
; Fizz
(FizzBuzz '10)
; Buzz
(FizzBuzz '11)
; 何も出力されない
```
