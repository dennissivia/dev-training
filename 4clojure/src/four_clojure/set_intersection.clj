;; (ns 4clojuree.set-intersection)


#light
(defn add-intersected [bs cs a]
  "ads a to bs if it is in bs"
  (if (clojure.set/subset? #{a} bs)
    (clojure.set/union cs #{a})
    cs))

#light
(defn intersect [as bs]
  (reduce (partial add-intersected bs) #{} as))

(intersect #{1 2 3 4} #{3 4 5 6})
