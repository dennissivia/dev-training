(defn num-grouping [i]
  (cond
    (neg? i)  :negative
    (zero? i) :zero
    (pos? i)  :positive))

(dfn percentage [coll n]
  (* 1.0 (/ (count coll) n)))

(defn to-percentage [n {negatives :negative, zeros :zero, positives :positive}]
  (map #(percentage %1 n) (vector positives negatives zeros)))

(defn print-result [coll]
  (println (clojure.string/join "\n" coll)))

(defn plus-minus [n list]
  (->> list
      (group-by num-grouping)
      (to-percentage n)
      (print-result)))

(defn run []
  (let [n (Integer/parseInt (read-line))
       nums (map #(Integer/parseInt %1) (clojure.string/split (read-line) #"\s"))]
  (plus-minus n nums)))

(run)
