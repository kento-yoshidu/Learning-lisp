# 出力

## print

`print`関数。シンプル。改行してから渡した値を出力する。結果はエスケープコードで囲われる。

```lisp
(print "Hello Lisp")
;=> "Hello Lisp"
```

## prin1

`print`と似ているが、出力前の改行を行わない。

```lisp
(prin1 "Hello Lisp")
(prin1 "Hello Lisp")
;=> "Hello Lisp""Hello Lisp"
```

## princ

`prin1`と似ているが、エスケープコードを使用しない。

```lisp
(princ "Hello Lisp")
(princ "Hello Lisp")
Hello LispHello Lisp
```

## format

format関数。整形した文字列を返す。

```lisp
(format t "Hello lisp")
;=> Hello lisp
```

第一引数はストリーム（出力先？）の指定。`t`であれば標準出力。`nil`なら出力せずに文字列を返すのみ。



## terpri

`terpri`関数は改行を出力する。

```lisp
(print "Hello Lisp")
(terpri)
(print "Hello Lisp")
```

## 参考

http://www.nct9.ne.jp/m_hiroi/clisp/abcl09.html
