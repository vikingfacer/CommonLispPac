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