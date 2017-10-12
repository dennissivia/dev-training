(defn read-input-list []
  (map read-string (clojure.string/split (read-line) #" ")))

(defn process-step []
  (let [ [n k] (map read-string (clojure.string/split (read-line) #" "))
        lst (read-input-list)
        freqs (frequencies lst) ]
    (distinct (filter #(>= (get freqs %1) k) lst))))

(defn handle-no-match [lst]
  (if (empty? lst)
    '(-1)
    lst))

(defn main []
  (let [T (read-string (read-line))]
    (->> (repeatedly T process-step)
         (map handle-no-match)
         (map #(clojure.string/join " " %))
         (map println)
         (doall))))
(main)
