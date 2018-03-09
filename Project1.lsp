"
CSCI 310: Organization of Programming Languages, Spring 2018
Program 1: Functional Programming
Author: Zack Maguffin
Date Due: Feburary 19th 
"

"1. Reverse but not sublists"
(defun hlbackwards(L)
	(cond
		((null L) nil) ;Base Case
		(T (append( hlbackwards (cdr L)) (list (car L))))
	)
)

"2.Reverse with sublists"
(defun llbackwards(L)
	(cond
		((null L) nil) ;Base Case
		((listp (car L))(append (llbackwards (cdr L)) (list (llbackwards (car L)))))
		(T (append (llbackwards(cdr L))(list (car L))))	
	)
)


"3. Palindrom function"
(defun palindrome (L)
	(cond 
		((equal L (llbackwards L)))
		(T (append L (cdr(llbackwards L))))
	)
)
"4. Ionah Function, Move pegs from disk 1 to disk 3"
(defun ionah(n)
	(ionahhelper n 3 1 2)
	
)

(defun ionahhelper(n to from use)
	(cond 
		( 
			(> n 0)
			(ionahhelper(- n 1) use from to) 
			(format T "Move disk from peg ~D to peg ~D~&" from to)
			(ionahhelper(- n 1) to use from)
		)
	)
)
"5. Sequence Function, if n = 1 -> 0... if n = 2 -> 1....if n >2 -> 2S(n-1) + S(n-2)"

(defun sequencemath(n)
	(cond
		((equal n 1) 0) ;n = 0 make it a one
		((equal n 2) 1) ;n = 1 make it a two
		(T (+ (* 2 (sequencemath(- n 1))) (sequencemath(- n 2)))) ;n more than 2
		;2(seq(n-1))+2(seq(n-1))
	)
)


(defun mysequence(n) 
	(cond
		((equal n 1) '(0)) ;n = 0 make it a one
		((equal n 2) '(0 1)) ;n = 1 make it a two
		(T (append (mysequence (- n 1)) (list (sequencemath n)))) ;output the math to a list n times if larger than two
	)
)
"6. Perumutation Function"
(defun permutations (lst &optional (remain lst))
	(cond 
		((null remain) nil)
		((null (rest lst)) (list lst))
        (T (append (mapcar (lambda (l) (cons (first lst) l)) (permutations (rest lst)))
        (permutations (append (rest lst) (list (first lst))) (rest remain))))
	)
)	

"7. Argue function"
(defun argue (L)
	(cond
		((null L) ())
		((equal (car L) 'i) (append (list 'you ) (argue (cdr L))))
		((equal (car L) 'you)(append (list 'i )	(argue (cdr L))))
		((equal (car L) 'your) (append (list 'my )(argue (cdr L))))
		((equal (car L) 'my) (append (list 'your )(argue (cdr L))))
		((equal (car L) 'am) (append (list 'are 'not )(argue (cdr L))))
		((equal (car L) 'are) (append (list 'am 'not )(argue (cdr L))))	
		((equal (car L) 'arent) (append (list 'am ) (argue (cdr L))))	
		((equal (car L) 'does) (append (list 'doesnt )(argue (cdr L))))
		((equal (car L) 'doesnt) (append (list 'does )(argue (cdr L))))
		((equal (car L) 'is) (append (list 'is 'not ) (argue (cdr L))))
		((equal (car L) 'isnt) (append (list 'is )(argue (cdr L))))
		((equal (car L) 'isnt) (append (list 'is )(argue (cdr L))))
		(T L)		
	)
)

"8. BubbleSort Function"

(defun bubblesort(list)
	(cond
		((null list) ())
		(T(<= (length list) 1) list (let ((pivot (first list)))
		(append	(bubblesort (remove-if-not #'(lambda (x) (< x pivot)) list))
		(remove-if-not #'(lambda (x) (= x pivot)) list)
		(bubblesort (remove-if-not #'(lambda (x) (> x pivot)) list)))))
	)
)
	
	
	
	
	
