(defn read-ints
  ([]  (map read-string (clojure.string/split (read-line) #" ")))
  ([n] (take n (map read-string (clojure.string/split (read-line) #" ")))))

#light
(defn count-on-time [lst]
  (let [on-time (fn [x] (<= x 0))]
    (count (filter on-time lst))))

#light
(defn cancel-class? [lst n]
  (< (count-on-time lst) n))

#light
(defn process-query []
  (let [[n k] (read-ints)
        lst (read-ints n)]
    (if (cancel-class? lst k) "YES" "NO")))

#light
(defn main []
  (let [q (read-string (read-line))]
    (->> (repeatedly q process-query)
         (map println)
         (doall))))

(main)
(cancel-class? [0 -1 -1 -1] 2)
(cancel-class? [0 0 1 -1] 3)
(cancel-class? [0 0 0 -1] 3)
