#light
(defn intrlve [as bs]
  (let [cnt (min (count as) (count bs))]
    (loop [i 0 result '()]
      (if (= i cnt)
        (reverse result)
        (recur (inc i) (conj (conj result (nth as i)) (nth bs i)))))))

(intrlve [1 2 3] [:a :b :c])
(= (intrlve [1 2 3] [:a :b :c]) '(1 :a 2 :b 3:c))
(intrlve [1 2 3] [:a :b :c])
