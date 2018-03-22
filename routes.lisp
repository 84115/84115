(in-package :eight)

(defun page-not-found (res)
  "Sends a 404 error."
  (send-response res
                 :status 404
                 :body (layout 'default (list :content "Page not found."
                                              :title "Page not found."))))

(defun page-hit (res)
  "Great Success"
  (send-response res
                 :body (layout 'default (list :content "HIT"
                                              :title "HIT"))))

;; clear out all routes (start anew)
(clear-routes)

(defroute (:get "/") (req res)
  (let ((body (load-view :pages/index)))
    (send-response res :headers '(:content-type "text/html") :body body)))

(defroute (:get "/best-practices") (req res)
  (send-response res :status 301 :headers '(:location "/docs/best-practices") :body "moved <a href=\"/docs/best-practices\">here</a>"))

(defroute (:get "/about") (req res)
  (let ((body (load-view :pages/about)))
    (send-response res :headers '(:content-type "text/html") :body body)))

(defroute (:get "/cache") (req res)
  (load-views)
  (send-response res :body "Cache cleared."))

(def-directory-route "/" (format nil "~aassets" *root*) :disable-directory-listing nil)

(defroute (:get "/docs(/(.*))?") (req res args)
  (handler-case
    (let* ((view (intern (string-upcase (format nil "docs/~a" (or (cadr args) "index"))) :keyword))
           (content (load-view view)))
      (send-response res :headers '(:content-type "text/html") :body content))
    (view-not-found ()
      (page-not-found res))
    (error (e)
      (send-response res :status 500 :body (format nil "~a" e)))))

(defroute (:get "/blog(/(\d{4}/\d{2}/\d{2}/.*))?") (req res args)
  (page-hit res))

(defroute (:* ".+") (req res)
  (page-not-found res))
