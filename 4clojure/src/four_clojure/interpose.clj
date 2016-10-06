

#light
(defn my-interpose [val coll]
  (conj (reduce #(apply conj %1 [%2 val]) [] (butlast coll)) (last coll)))

(my-interpose 0 [1 2 3])
