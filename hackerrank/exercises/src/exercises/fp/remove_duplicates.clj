(defn remove-duplicates [s]
  (->> (seq s)
      (distinct)
      (clojure.string/join "")))

(defn main [] (remove-duplicates (read-line)))
