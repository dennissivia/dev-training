;; Map -> Num -> Num -> Bool
(defn has-collision? [map k v]
  (and (get map k) (not (= (get map k) v))))

;; ([Num, Num]) -> Bool
(defn is-function [input]
  (let [max_pos (count input)]
    (loop [hsh {} pos 0 collision-found false]
      (if (or (= pos max_pos) (= true collision-found))
        (not collision-found)
        (let [[k v] (nth input pos)]
          (if (has-collision? hsh k v)
            (recur (conj hsh {k v}) (inc pos) true)
            (recur (conj hsh {k v}) (inc pos) false)))))))

;; Num -> (String)
(defn get-input-lines [n]
  (doall (repeatedly n read-line)))

;; Bool -> String
(defn translate-step-result [result]
  (if result "YES" "NO"))

;; () -> IO ()
(defn process-step []
  "interactor function with IO"
  (let [n (read-string (read-line))]
    (->> n
         (get-input-lines)
         (map #(clojure.string/split %1 #" "))
         (map (fn [[l r]] (vector (read-string l) (read-string r))))
         (is-function)
         (translate-step-result)
         (println))))

;; () -> IO ()
(defn process []
  (let [n (read-string (read-line))]
    (doall (repeatedly n process-step))))

(process)
