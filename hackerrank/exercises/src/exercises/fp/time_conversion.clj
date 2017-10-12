(defn calculate-24h-hour [hour ampm]
  (cond
    (and (= ampm "PM") (= hour 12)) "12"
    (and (= ampm "AM") (= hour 12)) "00"
    (= ampm "PM")      (format "%02d" (+ hour 12))
    :else (format "%02d" hour )))

(defn time-conversion [input]
  (let [ [_ h m s ampm] (re-matches #"(\d{2}):(\d{2}):(\d{2})(AM|PM)" input)
        hour (calculate-24h-hour (Integer/parseInt h) ampm) ]
    (println (str hour ":" m ":" s))))

(time-conversion (read-line))
