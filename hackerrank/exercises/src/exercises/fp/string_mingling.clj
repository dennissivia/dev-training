
;; (defn zip [a b]
;;   (clojure.string/join (flatten (vector a b))))

;; (def a (read-line))
;; (def b (read-line))

;; (-> (zip a b)
    ;; (println))
(println (clojure.string/join (flatten (map vector (clojure.string/split (read-line) #"") (clojure.string/split (read-line) #"")))))
