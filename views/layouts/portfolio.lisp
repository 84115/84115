(in-package :eight)

(deflayout portfolio (data)
  (parent-layout 'default data
      (:div :class "documentation clear"
        (str (getf data :content)))))

