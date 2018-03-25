(in-package :eight)

(deflayout blog (data)
  (parent-layout 'default data
    (:div :class "documentation clear"
      (:div :class "doc-nav"
        (:ul
          (:li (:a :href "/blog" "Home"))
          (:li (:a :href "/blog/2018/03/25/hello-world" "Hello World"))
          (:li (:a :href "/" "..."))))
      (:div :class "doc-content"
        (str (getf data :content))))))

