(ns exercises.fp.polygon-perimeter
  {:lang :core.typed}
  (:require [clojure.core.typed :as t]))

;; (t/ann f [ :-> [Int]])
(defn read-point []
  (vec (map read-string (clojure.string/split (read-line) #" "))))

(defn read-points []
  (let [T ((comp read-string read-line))]
    (doall (into [] (repeatedly T read-point)))))

;; [Num, Num] -> [Num, Num] -> Num
(defn pair->distance [[[x1 y1] [x2 y2]]]
  "Calculates the distance of two points"
  (let [delta_x (Math/abs (- x2 x1))
        delta_y (Math/abs (- y2 y1))]
    (Math/sqrt(+ (* delta_x delta_x) (* delta_y delta_y)))))

;; [[Num, Num]] -> [[Num Num]]
(defn points->pairs [points]
  (partition 2 1 points))

(defn main []
  (let [points (read-points)]
  (->> (conj points (first points))
       (points->pairs)
       (map pair->distance)
       (reduce + 0)
       (println))))
(main)
