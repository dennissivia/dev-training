
(defn rotate [s n]
  (let [len (count s)]
    (->> s
         (cycle)
         (drop n)
         (take len)
         (clojure.string/join))))

;; note we have to start with the first permutation
;; and finish with the original string
;; hence we use 1 .. n+1 and not 0 .. n
(defn all-rotations [s]
  (let [len (count s)]
    (map (partial rotate s) (range 1 (inc len)))))

(defn main []
  (let [n (read-string (read-line))
        strings (repeatedly n read-line)]
    (->> (map all-rotations strings)
        (map #(clojure.string/join " " %1))
        (map println)
        (doall))))
(main)
