(ns exercises.pangram)

;; Challange https://www.hackerrank.com/challenges/pangrams

#light
(defn string->alphabet [s]
  (->> s
       ((comp sort distinct seq clojure.string/lower-case))
       (filter (complement #(= \space %)))))

#light
(def alphabet (map char (range 97 123)))

#light
(defn pangram? [s]
  (= (string->alphabet s) alphabet))

(defn interpret-result [predicate]
  (if predicate
    "pangram"
    "not pangram"))

(defn main []
  (-> (read-line)
      (pangram?)
      (interpret-result)
      (println)))

(main)
;; (def input1 "We promptly judged antique ivory buckles for the next prize" )
;; (def input2 "We promptly judged antique ivory buckles for the prize" )
;; (string->alphabet input1)
;; (pangram? input1)
;; (pangram? input2)
