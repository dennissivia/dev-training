(defn lonely-int [lst]
  (->> lst
       (frequencies)
       (filter #(= (second %1) 1))
       ((comp first first))
       (println)))

(def n (read-line))
(def lst (map read-string (clojure.string/split (read-line) #" ")))
