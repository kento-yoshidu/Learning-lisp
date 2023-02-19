#|
; print関数
; 改行してから出力
(print "Hello Lisp")

; prin1関数
; 改行せずに出力
(prin1 "Hello Lisp")
|#

; princ関数
; printと違い、エスケープコードを使用しない（= ""で囲われない）
(princ "Hello Lisp")
(princ "Hello Lisp")

; format関数
; tで標準出力へ出力
; (format t "Hello lisp")

; 改行を出力する
; (print "Hello Lisp")(terpri)(print "Hello Lisp")

; carはリストの最初の要素を返す
(print (car '(1 2 3)))
;=> 1

; cdrはリストのcar以外をリストとして返す
(print (cdr '(1 2 3)))
;=> (2 3)

; nilが返る
(print (cdr '(1)))

; cdrのcdrはcddr
(print (cddr '(1 2 3)))
;=> (3)

; cdrのcdrのcarはcaddr
(print (caddr '(1 2 3)))
;=> 3

(ql:quickload "usocket")
