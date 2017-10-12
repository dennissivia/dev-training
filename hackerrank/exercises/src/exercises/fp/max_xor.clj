
(defn gen-pairs [l r]
  (for [ x (range l r) y (range l r)] (vector x y)))

(defn max-xor [pairs]
  (apply max (map (fn [[l r]] (bit-xor l r )) pairs)))

(defn run [l r]
  (->> (gen-pairs l r)
       (max-xor)
       (println)))

(def L (read-string (read-line)))
(def R (read-string (read-line)))
(run L (inc R))
