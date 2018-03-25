(in-package :eight)

(deflayout portfolio (data)
  (parent-layout 'default data
    (:div :class "documentation clear"
      (:div :class "doc-content"
        (str (getf data :content))))))

