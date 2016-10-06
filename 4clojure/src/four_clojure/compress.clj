(ns )

#light
(def compress-reducer
  (fn [[result last-char :as akku] current]
    (if (= last-char current)
      akku
      [(conj result current) current])))

#light
(def compress-any
  (fn [input]
    (let [coll (seq input)]
      (->>
       (reduce compress-reducer [[] nil] coll)
       (first)
       ))))

(def compress-string
  (fn [inp]
    (apply str (compress-any inp))))


(compress-string "Leeeeeerrroyyy")
(compress-any [1 1 1 2 3 4 5 5 6 0])
(compress-reducer [[] nil] \f)
(compress-reducer [[\f] \f] \f)
