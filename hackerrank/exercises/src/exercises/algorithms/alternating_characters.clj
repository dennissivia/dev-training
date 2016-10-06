(ns exercises.algorithms.alternating-characters)
(refer 'clojure.string :as :string)

(defn read-int
  "read a single int from stdin"
  ([]  (read-string (read-line))))

(defn repeat-and-print [n f]
  "execute f n times and print all outputs eagerly"
  (->> (repeatedly n f)
       (map println)
       (doall)))

(defn inc-alternating [output-tuple cur]
  (let [[char count] output-tuple]
    (println cur)
    (if (= cur char)
      [char (inc count)]
      [cur count])))

(defn count-deletions [s]
  (second (reduce inc-alternating [nil 0] (clojure.string/split s #""))))

(defn process-step []
  (let [s (read-line)]
    (count-deletions s)))

(defn main []
  (repeat-and-print (read-int) process-step))

(main)

;; (inc-alternating ["f" 0] "e")
;; (count-deletions "AAAA")
