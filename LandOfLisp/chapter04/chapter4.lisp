; false
(print (if '()
    'ture
    'false))

; 空リスト()がfalseなので再帰しやすい

(defun rec (list)
    (print list)
    (if list
        (1+ (rec(cdr list)))
        0))

(print (rec '(I LOVE LISP)))
#|
(I LOVE LISP) 
(LOVE LISP) 
(LISP) 
NIL 
3 
|#

; 全てT(True)
(print (eq '() nil))
(print (eq '() ()))
(print (eq '() 'nil))

(print
    (if (= (+ 1 2) 3)
        '=
        '!=))
;=> =

(print
    (if (= (+ 1 2) (- 4 1))
        '=
        '!=))
;=> =

(print
    (if (= (+ 1 3) (car '(4 1)))
        '=
        '!=))
;=> =

(print
    (if (oddp 5)
        'odd))
;=> ODD
;=> 奇数ならNILが返る

;=> 1つの式しか評価しない
(print
    (if (oddp 5)
        'odd
        (1 / 0)))
;=> ODD

(defvar *bool* nil)

(if (oddp 5)
    (progn (setf *bool* t) (print 'odd-number))
    ;=> ODD-NUMBER
    (print 'EVEN))

(print *bool*)
;=> T

; when
(defvar *num* 5)
;=> numが奇数なら2倍にしてセット
(when (oddp *num*)
    (setf *num* (* *num* 2))
    (print *num*))
    ;=> 10

;=> numが奇数ではないなら2で割ってセット
(unless (oddp *num*)
    (setf *num* (/ *num* 2))
    (print *num*))
    ;=> 5

#|
(cond
    (test1 then-case)
    (test2 then-case)
    (test3 then-case)
    ...
    (t else-case))
|#

(defvar *arch-enemy* nil)
(defun pudding-eater (person)
    (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
                                '(curse you lisp alien - you ate my pudding))
          ((eq person 'johnny) (setf *arch-enemy* 'unless-old-jonny)
                                '(i hope you choked on my pudding johnny))
            (T                    '(why you eat my pudding stranger?))))

(print (pudding-eater 'johnny))
(print *arch-enemy*)
(print (pudding-eater 'henry))
(print *arch-enemy*)
(print (pudding-eater 'kento))

(defun test-cond (num)
    (cond ((eq num '1) '("You're No.1") '("This is 1"))))

(print (test-cond 1))

;参考 http://wisdom.sakura.ne.jp/programming/lisp/clisp11.html
