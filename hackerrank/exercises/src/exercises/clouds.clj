(use '[clojure.string :only (split triml)])

(defn read-clouds []
  (map #(Integer/parseInt %1) (clojure.string/split (read-line) #"\s")))

(defn jump-two? [pos size lst]
  (and (< (+ pos 2) size) (= (nth lst (+ pos 2) nil) 0)))

(defn process-internal [lst n pos cnt]
  (if (= pos (- n 1 ))
    cnt
    (if (jump-two? pos n lst)
      (process-internal lst n (+ pos 2) (+ cnt 1) )
      (process-internal lst n (+ pos 1) (+ cnt 1) ))))

(defn process []
  (let [n      (Integer/parseInt (read-line))
        clouds (read-clouds)]
    (process-internal clouds n 0 0)))

(println (str (process)))
