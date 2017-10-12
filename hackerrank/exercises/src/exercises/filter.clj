(defn filter-list [upper-limit, lst]
  (filter #(< %1 upper-limit) lst))

