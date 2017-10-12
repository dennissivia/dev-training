(use '[clojure.string :only (split triml)])

(defn read-ints []
  (map #(Integer/parseInt %1) (clojure.string/split (read-line) #"\s")))


(defn- calculate-score [[a b]]
  (cond
    (> a b) [1 0]
    (= a b) [0 0]
    (< a b) [0 1]))



(defn process []
  (let [as (read-ints)
        bs (read-ints)
        input (map vector as bs)
        scores (map calculate-score input)
        result [0 0]]
        (apply (partial map +) scores)))

(println (clojure.string/join " " (process)))
