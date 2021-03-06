; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.


; loading a trivial-shell with quicklisp 
; (ql:quickload "trivial-shell")

; (range 10 :min 1 :step 1)
(defun range (max &key (min 0) (step 1))
   (loop for n from min below max by step
      collect n))

(defun print-elements-of-list (list)
       "Print each element of LIST on a line of its own."
       (while list
         (print (car list))
         (setq list (cdr list))))

(defun adder (n) (lambda (x) (x + n)))


(defun mod3or5 (l) 
	; filter lambda function returns true or false if mod 3 or 5 is 0
	(remove-if-not (lambda (n)(or 
								(zerop (mod n 5))
								(zerop (mod n 3)))) l))

(defun problem1 ()
	(mod3or5 (range 1000 :min 0 :step 1)))

; Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
; 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
; By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

(defun fibbi (n)
	(cond ((> 1 n) 0)
		  ((= 1 n) 1)
		  ((< 1 n) (+ (fibbi (- n 1)) (fibbi (- n 2))))))

(defun fibb-s (x)
	; this is slow cause of recursion 
	(mapcar #'(lambda (n) (fibbi n))
		(range x :min 0 :step 1)))

(defun upto (x)
	(cond ((eq x 0) ))
)

(defun fibr (l )
	(cond ((eq (length l) 0) '())
		  ((eq (length l) 1) '(1))
		  ((eq (length l) 2) '(1 1))
		  ((> (length l) 2) 
				(append l (list (reduce #'+ (last l 2)))))			
			))



; (defun fib-range (n)




; 	)


(defun problem2 ()
	(reduce #'+ (remove-if-not (lambda (n) (evenp n)) (fibb-s 100))))















