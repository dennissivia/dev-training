(ns )


(defn duplicate [input]
  (loop [inp input result []]
    (let [[head & tail] inp]
      (if (empty? inp)
        result
        (recur tail (conj result head head))
        ))))

(duplicate [1 2 3])
