(ql:quickload :eight)
(vom:config t :info)
(let ((blackbird:*debug-on-error* t)
      (wookie-config:*debug-on-error* t))
  (eight:start :port 8080))

