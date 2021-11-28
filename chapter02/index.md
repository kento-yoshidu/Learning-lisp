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

## トップレベル変数の定義

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

また、変数名はケバブケースで定義するのが普通。

```lisp
(defvar *my-sample-var*)
```

## 関数

関数定義には`defun`関数を使う。

```lisp
(defun function_name (arg))
```

渡された文字列に`!!!`をつけて返す関数。文字列の結合は`concatenate`関数で行う。

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

`smaller`関数の定義。

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

`(1- (guess-my-number))`で`50`から`1`引いた数を`*big*`に格納する(`setf`関数)。続けて`guess-my-number`を呼び出し、`1 + 50`の1ビット右シフトが行われ、`25`が出力される。

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

トップレベル変数をリセットする関数を作成

```lisp
(defun start_over()
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number)
)

(print
  (start_over)
)
```

## ローカル変数の定義

`let`を使う。変数宣言部全体を`()`で囲う。変数名を値のセットも`()`で囲う。

```lisp
(let
  ((a 1))
  (print a)
  ; 1
)

(print a)
; variable A has no value
```

```lisp
(let
  ((a 2)(b 10))
  (print (* a b))
  ; 20
)
```

## ローカル関数の定義

`flet`を使う。下記は与えられた値に100を足して返す`f`関数。

```lisp
(flet
  ((f (n) (+ n 10)))
  (print (f 100))
  ; 110
)
```

```lisp
(flet
  ((f (n) (+ n 10)))
)

(print
  (f 10)
  ; undefined function F
)
```

## `labels`関数

同じローカル関数内で、関数を呼び出すときに使用。

`g`を呼び出すと、`(f n)`足す`6`が実行。`f`が呼ばれ、`10`足す`10`が返る。`20`足す`6`が返る。

```lisp
(labels
  (
    (f (n) (+ n 10))
    (g (n) (+ (f n) 6))
  )
  (print (g 10))
  ; 26
)
```

