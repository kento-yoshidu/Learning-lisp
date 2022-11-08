# 条件と判断

## nilと()

空のリスト`'()`は偽として扱われる。再帰を扱いやすくなる。

```lisp
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
    'nope))
; YUP

(print
  (if (= (+ 1 2) 4)
    'yup
    'nope))
; NOPE
```

```lisp
(
  let ((a 7)) 
  (if (= (rem a 2) 0)
    (print 'even)
    (print 'odd)))
; ODD
```

空リストは偽となるので、リストが空かどうかも調べられる。

```lisp
(
  let ((a 1))
  (if a
    (print a)
    (print 'empty)))
    ; 1

(
  let ((list '()))
  (if list
    (print list)
    (print 'empty)))
    ; EMPTY
```


グローバル変数の書き換え。`oddp`で奇数判定を行う。

```lisp
(defvar *number-was-odd* nil)

(if (oddp 7)
  (progn (setf *number-was-odd* t)
    'odd-number)
  'even-number)

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
  (print "Bye."))
; 何も表示されない
```

## unless

`when`の逆。

```lisp
(unless (oddp 5)
  (print "that is not odd")
  (print "Bye."))
; 何も表示されない

(unless (oddp 6)
  (print "that is not odd")
  (print "Bye."))
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
; 何も出力されない
```

## andとor

```lisp
(print
  (and (oddp 5) (oddp 7) (oddp 9)))
; T

(print
  (and (oddp 5) (oddp 7) (oddp 10)))
; NIL

(print
  (or (oddp 5) (oddp 7) (oddp 10)))
; T
```

### member関数

リストの中に指定の値が含まれているかを判定。含まれていればその値を先頭にしたリスト、含まれていなければ`nil`を返す。

```lisp
(print
  (member 4 '(3 4 5 6)))
; (4 5 6)

(print
  (member 1 '(3 4 5 6)))
; NIL
```

### find-if関数

第一引数に関数、第二引数にリストを与える。関数が真を返すまで走査する。なければ偽を返す。

```lisp
(print
  (find-if #'oddp '(2 4 5 6)))
; 5

(print
  (find-if #'oddp '(2 4 6 8)))
; NIL
```

## 比較関数

シンボル同士を比較するときは、`eq`を使う。

```lisp
(defparameter *fruit* 'apple)

(cond
  ((eq *fruit* 'apple)
    (print "This is an aplle"))
  ((eq *fruit* 'orange)
    (print "This is a orange")))
; This is an apple

; 例えば数値同士ならnilが返る。
(print 
  (eq 3.0 3.0))
; NIL
```

シンボル同士でなければ`equal`を使う。

```lisp
(print
  (equal (list 1 2 3) (list 1 2 3)))
; T

(print
  (equal (list 1 2 3) (list 1 2)))
; NIL

(print
  (equal '(1 2 3) (cons 1 (cons 2 (cons 3 ())))))
; T

; シンボル同士の比較もできる
(print (equal 'apple 'apple))
; T
```

`eql`は`eq`と似ているが、数値や文字の比較ができる。

```lisp
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
```

`equalp`は大文字小文字や整数と浮動小数点数を比較できたりする。

```lisp
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
```