
#light
(defn repl [coll n]
  (reduce #(apply conj %1 (repeat n %2)) [] coll))

(= (repl [:a :b] 4) '(:a :a :a :a :b :b :b :b))
(repl [:a :b] 4)

(= (repl [[1 2] [3 4]] 2) '([1 2] [1 2] [3 4] [3 4]))
(repl [[1 2] [3 4]] 2)
