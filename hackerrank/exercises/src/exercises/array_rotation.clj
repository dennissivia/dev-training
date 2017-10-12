;; (defn rotate-array [l k]
;;   (let [len (count l)
;;         real_k (mod k len)]
;;     (loop [n 0 result (reverse l)]
;;       (let [[x & lxs] result
;;             xs (into [] lxs)]
;;         (if (= n real_k)
;;           (reverse result)
;;           (recur (inc n) (conj xs x)))))))

;; (defn rotate [c k]
;;   (loop [coll (vec (reverse c)) n k]
;;     (if (= n 0)
;;       coll
;;       (let [[h & t] coll]
;;         (recur (into t h) (dec n))))))

(defn print-list-items [lst]
  (doall (map println lst)))

(defn read-queries [n]
  (->> (repeatedly n read-line)
       (mapv read-string)))

(defn str->intList [s]
  (map read-string (clojure.string/split s #" ")))

(defn rotate [coll n k]
  (let [smallest_k (mod k n)
        pos (- n smallest_k)
        [l r] (split-at pos coll)]
    (concat r l)))

(defn main []
  (let [[n k q] (str->intList (read-line))
        lst (str->intList (read-line))
        rotated (rotate lst n k)]
    (->> (read-queries q)
         (map #(nth rotated %1))
         (print-list-items))))

(main)

(rotate [1 2 3] 3 1)
