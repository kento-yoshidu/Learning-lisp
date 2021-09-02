## トップレベル定義

いわゆるグローバル変数。`defparameter`関数で作る。

`*small*`こんな風に**耳あて**をつけるのがぐろーばる変数の慣習。

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






