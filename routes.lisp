(in-package :eight)

(defun http-status (&optional (status 500) (res) (e "..."))
  (send-response res
                 :status status
                 :body (layout 'default (list
                                          :content (format nil "~a" e)
                                          :title (format nil "HTTP - ~a" status)))))

(defun defroutescan (dir)
  (defroute (:get (format nil "/~a(/(.*))?" dir)) (req res args)
    (handler-case
        (let* ((view (intern (string-upcase (format nil (concatenate 'string dir "/~a") (or (cadr args) "index"))) :keyword))
               (content (load-view view)))
               (send-response res :headers '(:content-type "text/html") :body content))
        (view-not-found ()
                        (http-status 404 res))
        (error (e)
               (http-status 500 res e)))))




;; clear out all routes (start anew)
(clear-routes)

(defroute (:get "/") (req res)
  (let ((body (load-view :pages/index)))
    (send-response res :headers '(:content-type "text/html") :body body)))

(def-directory-route "/" (format nil "~aassets" *root*) :disable-directory-listing nil)

(defroute (:get "/about") (req res)
  (let ((body (load-view :pages/about)))
    (send-response res :headers '(:content-type "text/html") :body body)))

(defroute (:* "/http/([0-9]+)") (req res args)
  (http-status (parse-integer (car args)) res))

(defroute (:* "/cache") (req res)
  (load-views)
  (send-response res
                 :headers '(:content-type "text/html")
                 :body "<!DOCTYPE html><html><head><title>Clearing Cache...</title><meta http-equiv='cache-control' content='no-cache'><meta http-equiv='expires' content='0'><meta http-equiv='pragma' content='no-cache'></head><body><h1>Clearing Cache...</h1><script>window.history.back()</script></body></html>"))

(defroutescan "docs")
(defroutescan "portfolio")
(defroutescan "blog")

(defroute (:* ".+") (req res)
  (http-status 404 res))
