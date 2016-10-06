
#light
(def zmap
  (fn [as bs]
    (let [max-pos (min (count as) (count bs)) ]
      (loop [pos 0 m {}]
        (if (= pos max-pos)
          m
          (recur (inc pos) (assoc m (nth as pos) (nth bs pos))) ))))
    )

(zmap [:a :b :c] [1 2 3 4 5])
