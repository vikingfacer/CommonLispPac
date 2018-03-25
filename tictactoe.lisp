; lang clisp 

; n by n tictactoe 
; quick program to learn some lisp 


; this board is for testing 
(defparameter *board* '((* * *) (* * *) (* * *)))

; builds range 
(defun range (max &key (min 0) (step 1))
   (loop for n from min below max by step
      collect n))

; builds a board with n by n 
(defun build-board (n with) 
  (loop for j from 1 upto n collect
  (loop for i from 1 upto n collect with) ))

; way to number a board for key access 
(defun num-board (x) 
  (pairlis (range (+ (length x) 1) :min 1)
    (loop for n in x 
        collect (pairlis (range (+ (length n) 1) :min 1) n))))


; one whay to do it 
(defun set-element (row column board to) 
  (setf (cdr (assoc row (cdr (assoc column board)))) to))

; set nth of nth in list of list
(defun set-nth-element (row column board to)
  (setf (nth row (nth column board)) to))

; check board

; build up and down at row and column 
(defun build-up (l column)
  (loop for n in l 
        collect (nth column n)))

; builds the acrosses
(defun build-across (l row)
  (nth row l))

; builds the columns
(defun symbol-checker (symb)
  (lambda (x) (eq x symb)))

(defun check-up-down (board row column symb)
  (or (reduce #'eq (mapcar (symbol-checker symb) 
                           (build-up board column)))
   (reduce #'eq (mapcar (symbol-checker symb) 
                        (build-across board row)))))

; diaginal do not need a row or column 
; to left to bottom right 
(defun build-diaginal (board)
	(loop for i from 0 upto (- (length board) 1)
       collect (nth i (nth i board))))

; bottom right to top left
(defun build-diaginal-down (board)
  (loop for i from (- (length board) 1) downto 0
        collect (nth i (nth (- (- (length board) 1) i) board))))



























