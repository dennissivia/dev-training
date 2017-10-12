(ns exercises.algorithms.bfs)


(defn read-ints
  ([]  (map read-string (clojure.string/split (read-line))))
  ([n] (take n (map read-string (clojure.string/split (read-line) #" ")))))


(defn undirected_adjacency_list [nodes edges]
  "turn a edge map into an adjacency list"

  )
(defn bfs [adj s])
(defn distances [adj, s])
(defn distance [adj s t])

#light
(defn read-edge []
  "read a single pair from stdin"
  (read-ints 2))

(defn indexed-map [lst]
  "move a nested list into a map with index as key"

  )

#light
(defn read-edges [m]
  (repeatedly m read-edge))

(read-edges 3)
