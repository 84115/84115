(in-package :eight)

(deflayout base (data :top-level t)
  (:html
    (:head
      (:title (str (conc (getf data :title) " | James Ball")))
      (:meta :name "viewport" :content "width=device-width, initial-scale=1")
      (:link :rel "stylesheet" :href "/css/template.css")
      (:link :rel "shortcut icon" :href "/favicon.png" :type "image/png")
      (:link :rel "stylesheet" :href "/css/highlight-lisp-theme.css" :id "hl-style"))

    (:body :class (getf data :body-class)
      (:div :id "container"
        (:header
          (:div :class "inner"
            (:h1 (:a :href "/" "james-ball.co.uk"))
            (:input :type "checkbox" :id "menu")
            (:label :for "menu" "Menu")
            (:nav
              (:ul
                (:li (:a :href "/portfolio" "Portfolio"))
                (:li (:a :href "/docs" "Docs"))
                (:li (:a :href "/blog" "Blog"))
                (:li (:a :href "/about" "About"))
                (:li (:a :href "/contact" "Contact"))
                (:li (:a :href "https://github.com/84115/84115" "Github"))
                ))))
        (str (getf data :content))
        
        (:footer
          (:div :class "footer-container"
            (:ul
              (:li (:a :href "/sitemap" "Sitemap"))
              (:li (:a :href "https://github.com/84115" "Github")))
            (:p "MIT Licensed | &copy; James Ball | " (:a :href "https://github.com/84115/84115" "Source Code")))))

      (:script :src "/js/main.js")
      (:script :src "/js/highlight-lisp.min.js"))))
