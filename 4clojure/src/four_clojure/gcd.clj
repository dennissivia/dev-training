(ns exercises.gcd)

#light
(defn gcd [a b]
  (loop [a a b b]
    (if (zero? b)
      a
      (recur b (mod a b)))))

(gcd 10 20)
