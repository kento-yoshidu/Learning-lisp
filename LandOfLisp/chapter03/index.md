# Lispの文法

## リスト

`()`を使う。**リスト**という。

```lisp
(print "Hello Lisp")
```

## シンボル

リテラルのこと？大文字、小文字を区別しない。

`eq`で比較する。同じであれば`T`が返ってくる。違えば`NIL`が返ってくる。

```lisp
(print (eq 'foo 'Foo))
; T

(print (eq 'foo 'bar))
; NIL
```

## 数値

整数と浮動小数点。計算時には型変換が行われる場合がある。

```lisp
(print (+ 1.0 10))
; 11.0
```

`expt`で乗数計算を行える。

```lisp
(print (expt 2 10))
; 1024
```

割り算は注意。有理数で返ってくる。

```lisp
(print (/ 4 6))
; 2/3

(print (/ 4.0 6))
; 0.6666667
```

有理数でも計算はちゃんと行える。

```lisp
(print
  (+
    (+(/ 4 6) (/ 1 6))
    (1)))
; 11/6
```

## 文字列

ダブルクオートで囲う。`\`でエスケープを行う。`princ`で文字列の出力を行う。

```lisp
(princ "This is \"Lisp\"")
; This is "Lisp"
```

## コードモードとデータモード

### コードモード

コードは**フォーム**と呼ばれるリストになっていなければならない。最初の要素がコマンド（関数名など）になっているリストをフォームという。

以下だと`print`、`expt`や`+`がコマンドであり、最初に来ているフォームになっている。つまりフォームがネストしている状態になっている。

```lisp
(print
  (expt
    (+ 2 2)
    (+ 4 4)))
; 65536
```

### データモード

ただのデータ、リテラル。もしくは、先頭に`'`をつけるとデータとして扱われる。これを**クオートする**という。

以下の例では`(+ 1 3)`がコードではなくデータとして扱われている。

```lisp
(print '(+ 1 3))
; (+ 1 3)
```

## コンスセル

Lispのリストは、**コンスセル**でつなぎ合わさっている。2つの箱が別々のものを指すことができる。

### `cons`

`cons`は渡されたそれぞれのオブジェクトへの参照を保管するメモリをアロケートする。データをそのままコンスセルに保存するわけではない。2つの間に`.`をも用いて、コンスセルを表す。

```lisp
(print (cons "Hello" "World"))
; ("Hello" . "World")
```

`nil`は**リストを終わらせる**ための特別なシンボルである。コンスセルの右側に`nil`を渡してみる。

```lisp
(print (cons "Bye" nil))
; ("Bye")
```

## car

リストの最初の要素を返す。

```lisp
(print
  (car '(pork beef chicken)))
; pork
```

## cdr

2番目移行の要素を返す。

```lisp
(print
  (cdr '(pork beef chicken)))
; (BEEF CHICKEN)
```

`car`と`cdr`はネストしてもいいが、

```lisp
(print
  (car
    (cdr '(pork beef chicken))))
; BEEF
```

`cadr`という、`car`と`cdr`を組み合わせた関数もある。

```lisp
(print
  (cadr '(pork beef chicken)))
; BEEF
```

## list

`list`関数を使ってもいい。`cons`をいくつも繋げなくてもリストを作れる。

```lisp
(print
  (list 'pork 'beef 'chicken))
; (PORK BEEF CHICKEN)

(print
  (list 'pork
    (list 'beef 'chicken)))
; (PORK (BEEF CHICKEN))
```




[コンスセルとconsとcarとcdr - TIL](https://tmg0525.hatenadiary.jp/entry/2018/07/26/230017)