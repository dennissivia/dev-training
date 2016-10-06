(ns )

#light
(defn drop-nth [coll n]
  (->> (map-indexed vector coll)
       (remove (fn [[idx val]] (zero? (mod (inc idx) n))))
       (map second)))

(drop-nth [1 2 3 4 5 6 7 8] 2)
