## 標準出力

### format

`format`関数を使う。第一引数に`t`を指定し、標準出力へ出力する。

```lisp
(format t "Hello Lisp")
; Hello Lisp
```

### print

`print`関数を使う。

```lisp
(print "Hello Lisp")
; Hello Lisp
```

## トップレベル定義

いわゆるグローバル変数。`defparameter`関数で作る。

`*small*`こんな風に**耳あて**をつけるのがグローバル変数の慣習。

```lisp
(defparameter *small* 1)
  (print *small*)
  ; 1
```

また、グローバル変数は上書きされる。

```lisp
(defparameter *small* 1)
	(print *small*)
	; 1

(defparameter *small* 3)
	(print *small*)
	; 3
```

グローバル変数を`defvar`関数を使って定義すれば上書きされない。

```lisp
(defvar *small* 1)
	(print *small*)
	; 1

(defvar *small* 3)
	(print *small*)
	; 1
```

## 関数

`defun`関数を使う。

```lisp
(defun function_name (arg))
```

渡された文字列に`!!!`をつけて返す関数。文字列の結合は`concatenate`で行う。

```lisp
(defun test_func (arg)
  (print
    (concatenate 'string arg "!!!")
  )
)

(test_func "Hello World")
; "Hello World!!!"
```

`guress-my-number`関数を定義。

```lisp
(defparameter *small* 3)
(defparameter *big* 10)

(defun guess-my-number ()
  (ash (+ *small* *big*) -1)
)

(print
  (guess-my-number)
)
; 6
```

`ash`関数はビットシフトを行う。第一引数に数値、第二引数が`1`なら左シフト、`-1`なら右シフト。

```lisp
(print
  (ash 11 -1)
)
; 5

(print
  (ash 11 1)
)
; 22
```

smaller関数の定義。

```lisp
(defparameter *small* 1)
(defparameter *big* 10)

(defun guess-my-number ()
  (ash (+ *small* *big*) -1)
)

(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number)
)

(print (smaller))
; 25
```

`(1- (guess-my-number))`で`50`から`1`引いた数をbigグローバル変数に格納する(setf関数)。続けて`guess-my-number`を呼び出し、`1 + 50`の1ビット右シフトが行われ、25が出力される。

`bigger`はその反対。

```lisp
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
```