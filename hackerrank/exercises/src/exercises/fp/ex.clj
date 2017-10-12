
(defn ** [x n] (reduce * (repeat n x)))

(defn product [x y]
  (reduce * (range x (+ y 1))))

(defn series [x]
  (for [y (range 0 10)]
    (/(** x y) (product 1 y))))

(defn e_to_the_x [x]
  (reduce + (series x)))

(defn read-input []
  (read-string (read-line)))

(defn run []
  (let [n (read-input)]
    (->> (range n)
         (map (fn [_] (read-input)))
         (map e_to_the_x)
         (map println)
         (doall))))
(run)
