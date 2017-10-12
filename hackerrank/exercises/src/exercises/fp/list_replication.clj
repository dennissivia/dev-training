(defn replicate-list [n lst]
  (mapcat #(repeat n %1) lst))
