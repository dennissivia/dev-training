(ns )

(defn my-range [start stop]
  (loop [value start result []]
    (if (= value stop)
      result
      (recur (inc value) (conj result value)))))

(take 1 (my-range 1 100000))
(my-range 1 10)
