
(defn odd-sum [lst]
  (->> lst
       (filter odd?)
       (reduce + 0 )))
