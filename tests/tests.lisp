; (load "~/quicklisp/local-projects/eight/tests/tests.lisp")

; (format t "~c[31mRED~c[0m~%" #\ESC #\ESC)
; (format t "~c[32mGREEN~c[0m~%" #\ESC #\ESC)
; (format t "~C[34mBLUE~c[0m~%" #\ESC #\ESC)
; (format t "~c[35mPURPLE~c[0m~%" #\ESC #\ESC)
; (format t "~c[36mTEAL~c[0m~%" #\ESC #\ESC)

; (format t "~c[31mFAILURE: {test-name}~c[0m~%" #\ESC #\ESC)
; (format t "~c[32mSUCCESS: {test-name}~c[0m~%" #\ESC #\ESC)


(defun print-success (str)
  (format t (concatenate 'string "~c[32mSUCCESS: " str "~c[0m~%") #\ESC #\ESC))

(defun defsuite (str)
  (format t (concatenate 'string "~%~C[34m" str "~c[0m~%") #\ESC #\ESC)
  ; (format t "~C[34m~v@{~A~:*~}~c[0m~%" (length "Eight Test Suite") "=" #\ESC #\ESC)
  (format t "~C[34m================~c[0m~%~%" #\ESC #\ESC))

(defmacro deftest (name vars &rest body)
  "..."
  ; MODIFY GLOBAL COUNTER...
  (print-success name)
  `(let (,@vars)
    (progn ,@body)))



(defsuite "Eight Test Suite")

(deftest "T equals T"
         ((p T))
         (assert (equalp T p) (p)))

(deftest "nil equals nil"
         ((p nil))
         (assert (equalp nil p) (p)))

(deftest "x is integer and equals 42"
         ((x 42))
         (assert (integerp x) (x))
         (assert (= 42 x) (x)))
