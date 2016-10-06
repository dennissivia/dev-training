(ns exercises.algorithms.camelcase-count)

(defn main []
  (let [str (read-line)]
    (-> str
        (clojure.string/split #"[A-Z]")
        (count)
        (println))))

(main)
