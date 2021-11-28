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
