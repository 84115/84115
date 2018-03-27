; (load "~/test.lisp")

; (format t "~c[31mRED~c[0m~%" #\ESC #\ESC)
; (format t "~c[32mGREEN~c[0m~%" #\ESC #\ESC)
; (format t "~C[34mBLUE~c[0m~%" #\ESC #\ESC)
; (format t "~c[35mPURPLE~c[0m~%" #\ESC #\ESC)
; (format t "~c[36mTEAL~c[0m~%" #\ESC #\ESC)

(defparameter *test-count-pass* 0)
(defparameter *test-count-fail* 0)
(defparameter *term-color-default* "~c[0m~%")

(defun defsuite (str)
  (terpri)
  (format t (concatenate 'string "~C[34m" str "~c[0m") #\ESC #\ESC)
  (terpri)
  (format t "~C[34m" #\ESC)
  (format t "~v@{~A~:*~}" (length str) "=")
  (format t "~c[0m" #\ESC)
  (terpri)
  (terpri))

(defun print-util (prefix str postfix)
  (format t (concatenate 'string prefix str postfix) #\ESC #\ESC))

(defun print-label (str)
  (print-util "~c[35mSHOULD: " str *term-color-default*))

(defun print-pass (str)
  (print-util "~c[32mPASS: " str *term-color-default*))

(defun print-fail (str)
  (print-util "~c[31mFAIL: " str *term-color-default*))

(defun ok (boolean message)
  (if boolean
      (progn
        (setq *test-count-pass* (incf *test-count-pass*))
        (print-pass message))
      (progn
        (setq *test-count-fail* (incf *test-count-fail*))
        (print-fail message))))

(defun fin ()
  (write-line (concatenate 'string "PASS COUNT: " (write-to-string *test-count-pass*)))
  (write-line (concatenate 'string "FAIL COUNT: " (write-to-string *test-count-fail*)))
  (write-line (concatenate 'string "TEST COUNT: " (write-to-string (+ *test-count-pass* *test-count-fail*)))))

(defmacro deftest (name vars &rest body)
  "..."
  (print-label name)
  `(let (,@vars)
    (progn ,@body)
    (terpri)))

(defsuite "Eight Test Suite")

(deftest "T equals T"
         ((p T))
         (ok (equalp T p) "T equals T"))

(deftest "nil equals nil"
         ((p nil))
         (ok (equalp nil p) "nil equals nil"))

(deftest "x is an integer and equals 42"
         ((x 42))
         (ok (integerp x) "x is an integer")
         (ok (= 42 x) "x equals 42"))

(fin)

