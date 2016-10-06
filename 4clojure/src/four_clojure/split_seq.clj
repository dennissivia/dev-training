
#light
(def part
  (fn [at xs]
    (loop [result [] coll xs pos 0]
      (let [[head & tail ] coll]
        (if (= pos at)
          [result coll]
            (recur (conj result head) tail (inc pos))))))
  )
(part 3 [1 2 3 4 5 6])
