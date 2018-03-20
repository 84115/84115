(in-package :eight)

(deflayout base (data :top-level t)
  (:html
    (:head
      (:title (str (conc (getf data :title) " | James Ball")))
      (:link :rel "stylesheet" :href "/css/template.css?2")
      (:link :rel "shortcut icon" :href "/favicon.png" :type "image/png")
      (:script :src "/js/wookie.js")
      ;; syntax highlighting
      (:link :rel "stylesheet" :href "/js/highlight-lisp/themes/wookie.css" :id "hl-style")
      (:script :src "/js/highlight-lisp/highlight-lisp.js"))
    (:body :class (getf data :body-class)
      (:div :id "container"
        (:header
          (:div :class "inner"
            (:h1 (:a :href "/" "james-ball.co.uk"))
            (:nav
              (:ul
                (:li (:a :href "/portfolio" "Portfolio"))
                (:li (:a :href "/docs" "Docs"))
                (:li (:a :href "/blog" "Blog"))
                (:li (:a :href "/about" "About"))
                (:li (:a :href "/contact" "Contact"))
                (:li (:a :href "https://gituhb.com/84115/84115" "Github"))
                ))))
        (str (getf data :content))
        
        (:footer
          (:ul
            (:li (:a :href "/sitemap" "Sitemap"))
            (:li (:a :href "https://gituhb.com/84115/84115" "Github"))
          (:p "MIT Licensed | &copy;")))))))
