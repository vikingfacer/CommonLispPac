(defun atomize (thing)
  (list thing))

(defun @ (thing)
  (car thing))

(defun swap (thing other)
  (push thing other))