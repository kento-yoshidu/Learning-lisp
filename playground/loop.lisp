; 0から5までがxに入る
; (dotimes (var limit result))
; var = 変数
; limit = この値まで繰り返される
; result = 最後に評価され、dotimesの戻り値になる
(dotimes (x 5)
  (format t "1: dotimes ~d~%" x))



