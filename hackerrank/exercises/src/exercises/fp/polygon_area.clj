;; (ns exercises.fp.polygon-area
;; {:lang :core.typed}
;; (:require [clojure.core.typed :as t]))

;; (t/ann f [ :-> [Int]])
#light
(defn read-point []
  (vec (map read-string (clojure.string/split (read-line) #" "))))

#light
(defn read-points []
  (let [T ((comp read-string read-line))]
    (doall (into [] (repeatedly T read-point)))))

#light
;;;;
(defn polygon-area-parts [points]
  (let [n (count points)]
    (loop [pos 0 deltas []]
      (if (= pos (- n 1))
        deltas
        (let [[x_i y_i] (nth points pos)
              [x_j y_j] (nth points (inc pos))
              entry (- (* x_i y_j) (* x_j y_i))]
          (recur (inc pos) (conj deltas entry)))))))

(defn polygon-area [points]
  (->> (polygon-area-parts points)
       (reduce + 0)
       (#(Math/abs %1))
       (#(* 0.5 %1))))

(defn main []
  (let [points (read-points)]
    (->> (conj points (first points))
         (polygon-area)
         (println))))

(main)
