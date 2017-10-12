
(defn filter-by-index [lst]
  (->> (map #(vector %1 %2) lst (range 1 (inc (count lst))))
       (filter #(even? (second %1)) )
       (map first)
       (map println)
       (doall)))

(filter-by-index '(2 5 3 4 6 7 9 8))
