(ns exercises.luck-balance)

(defn parse-pair [s]
  (mapv read-string (clojure.string/split s #" ")))

(defn read-pairs [n]
  (->> (repeatedly n read-line)
      (mapv parse-pair)))

(defn by-second-is-zero [coll]
  ((juxt filter remove) (fn [[l r]] (zero? r)) coll))

(defn calculate-luck [values k]
  "sort the values in reverse order and split at k for luck and cost separation"
  (->> values
       (map first)
       (sort)
       (reverse)
       (split-at k)
       (map #(reduce + 0 %1) )))

(defn process-pairs [pairs k]
  (let [[not-important important] (by-second-is-zero pairs)
         not-important-luck (reduce #(+ %1 (first %2)) 0 not-important)
        [important-luck important-cost] (calculate-luck important k)
        ]
    ( - (+ important-luck not-important-luck) important-cost)))

(defn main []
  (let [[n k] (map read-string (clojure.string/split (read-line) #" "))
        pairs (read-pairs n)]
    (println (process-pairs pairs k))))

(main)
