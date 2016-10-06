

(defn rev [coll]
  (loop [xs coll result '()]
    (if (empty? xs)
      result
      (let [head (first xs) tail (rest xs)]
        (recur tail (conj result head))))))
(rev '(1 2 3 4 5))
