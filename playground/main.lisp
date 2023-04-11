;; 標準出力

; write-line関数
; 文字列をストリームに書き込む
; 改行してエスケープコードを使用しない
(write-line "Hello Lisp")
(write-line "Hello Lisp")
;=> Hello Lisp

(write "Hello Lisp")
(write "Hello Lisp")

#|
; print関数
; 改行してから出力
(print "Hello Lisp")

; prin1関数
; 改行せずに出力
(prin1 "Hello Lisp")

; princ関数
; printと違い、エスケープコードを使用しない（= ""で囲われない）
(princ "Hello Lisp")
(princ "Hello Lisp")

; format関数
; tで標準出力へ出力
; (format t "Hello lisp")

; 改行を出力する
; (print "Hello Lisp")(terpri)(print "Hello Lisp")

; http://www.nct9.ne.jp/m_hiroi/clisp/abcl09.html

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
|#
