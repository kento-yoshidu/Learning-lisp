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
