(defn kangaroo []
 (let [[x1 v1 x2 v2] (map read-string (clojure.string/split (read-line) #" "))
       delta_x (- x2 x1)
       delta_v (- v2 v1)
       ]
   (if (and (< (* delta_x delta_v) 0) (zero? (mod delta_x delta_v)))
     (println "YES")
     (println "NO"))))

(kangaroo)
