

#light
(defn fact [n]
  (reduce * 1 (range 1 (inc n))))

(fact 1)
(fact 3)
(fact 5)
(fact 8)
