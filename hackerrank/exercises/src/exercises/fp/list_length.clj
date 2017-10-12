
(defn list-length [lst]
  (loop [[head & tail ] lst cnt 0]
    (if (empty? tail)
      cnt
      (recur tail (+ cnt 1)))))
