#light
(defn find-diff-index [str1 str2]
  (let [s1 (vec str1)
        s2 (vec str2)
        max_pos (dec (min (count s1) (count s2)))]
    (loop [pos 0 last_match nil]
      (let [match? (= (nth s1 pos) (nth s2 pos))]
        (if (and match? (< pos max_pos))
          (recur (inc pos) pos)
          (if match?
            (inc last_match)
            last_match))))))
#light
(defn compress-prefix [s1 s2]
  (let [index (find-diff-index s1 s2)]
    (if (nil? index)
      (hash-map :prefix "" :suffix1 s1 :suffix2 s2)
      (hash-map :prefix (subs s1 0 (inc index)) :suffix1 (subs s1 (inc index)) :suffix2 (subs s2 (inc index))))))

#light
(defn print-result [{p :prefix, s1 :suffix1, s2 :suffix2}]
  (println (str (count p)  " " p))
  (println (str (count s1) " " s1))
  (println (str (count s2) " " s2)))

(defn main []
  (let [a (read-line)
        b (read-line)]
    (->> (compress-prefix a b)
         (print-result))))
(main)

(print-result (compress-prefix "foobar" "foobaz"))
