(ns exercises.prelude)

(refer 'clojure.string :as :string)

(defn read-int
  "read a single int from stdin"
  ([]  (read-string (read-line))))

(defn read-ints
  ([]  (map read-string (clojure.string/split (read-line))))
  ([n] (take n (map read-string (clojure.string/split (read-line) #" ")))))

(defn repeat-and-print [n f]
  "execute f n times and print all outputs eagerly"
  (->> (repeatedly n f)
       (map println)
       (doall)))
