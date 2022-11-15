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

; car cdr
; carはセルの最初のスロット
(print (car (cons 'I '(LOVE LISP))))
;=> I

; firstでもOK
(print (first '(1 2 3)))

; cdrは2番目以降
(print (cdr (cons 'I '(LOVE LISP))))
;=> (LOVE LISP)

; restでもOK
(print (rest '(1 2 3)))
;=> (2 3)

; card carとcdrの組み合わせ
; 2番目のコンスセル(cdr)の1番目の要素(car)を返す

(print (cadr (cons '(1 2 3) '(4 5 6))))
;=> 4

; caddrならcdr(4 5 6)のcdr(5 6)のcar(5)
(print (caddr (cons '(1 2 3) '(4 5 6))))
;=> 5

; caddrならcdr(4 5 6)のcdr(5 6)のcdr(6)のcar(6)
(print (cadddr (cons '(1 2 3) '(4 5 6))))
;=> 6

; cdarもある
; car(1 2 3)のcdr(2 3)
(print (cdar (cons '(1 2 3) '(4 5 6))))
;=> (2 3)

; cddarならcarのcdrのcdr
(print (cddar (cons '(1 2 3) '(4 5 6))))
;=> (3)

; cadadrみたいなもの出来る。
; cdr(cons('(4 5 6) '(7 8 9)))のcar((4 5 6))のcdr(5 6)のcar(5)
(print (cadadr (cons '(1 2 3) (cons '(4 5 6) '(7 8 9)))))
;=> 5



; https://cortyuming.hateblo.jp/entry/20080717/p1

