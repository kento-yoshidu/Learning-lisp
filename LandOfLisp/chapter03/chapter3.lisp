; シンボル　基本的なデータ型
; アルファベット、数字、色んな記号

; eq関数でシンボルが正しいかを見れる
(print (eq 'foo 'FOO))
;=> T

; 数値　整数と浮動小数点数

(print (+ 1 2.0))
;=> 3/0

; 文字列　ダブルクオートで囲う
(princ "Hello Lisp")
;=> Hello Lisp

; コードモードとデータモード
; コードモード　→　読み込んでいるのはコード = フォーム
; フォーム　最初の要素が関数名などになっているリスト

(print (expt 2 3))
;=> 8

; データ シングルクオートでデータを表現する
(print '(expt 2 3))
;=> (EXPT 2 3)

; コンスセル
; Lispのリストはコンスセルでつなぎ合わされている。

'(1 2 3)
; 3つのコンスセルで作られている数値と次のセル。最後はnilを指す。

; cons
; cons関数。2つのデータを連結する。

; シンボルとシンボルの結合。一つのコンスセルを返す
(print (cons 'Hello 'Lisp))
;=> HELLO . LISP

(print (cons 'I '(LOVE LISP)))
;=> (I LOVE LISP)

(print (cons 'I (cons 'LOVE (cons 'LISP ()))))
;=> (I LOVE LISP)
