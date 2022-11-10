; 関数は()で囲う

; グローバル定数の定義
; グローバル変数は**で囲うのが慣習
(defparameter *small* 1)
(defparameter *big* 100)

#|
; printで標準出力
(print *small*)
;=> 1

(print *big*)
;=> 100
|#

; グローバル変数は上書きできる

#|
(defparameter *hoge* 5)
(print *hoge*)
;=> 5

(defparameter *hoge* 100)
(print *hoge*)
;=> 100
|#

; defavarなら上書きはできない
#|
(defvar *fuga* 1)
(defvar *fuga* 100)
(print *fuga*)
;=> 1
|#

; 関数はdefunで定義する
; (defun sample (args))

; ashは2で割って余りを切り捨て
(defun guess-my-number ()
    (ash (+ *small* *big*) -1))

; (print (guess-my-number))
;=> 50

; 1-で引数から1引いた数を返す
(defun smaller ()
    (setf *big* (1- (guess-my-number)))
    (guess-my-number))

; 1+は同じく
(defun bigger ()
    (setf *small* (1+ (guess-my-number)))
    (guess-my-number))

(print (guess-my-number))
;=> 50

(print (smaller))
;=> 25

(print (bigger))
;=> 37

; グローバル変数をリセットする
(defun start-over()
    (defparameter *small* 1)
    (defparameter *big* 100)
    (guess-my-number))

(start-over)
(print *small*)
(print *big*)
