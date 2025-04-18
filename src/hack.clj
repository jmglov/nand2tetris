(ns hack)

(def screen-offset 16384)
(def kbd-offset 24576)

(defn screen
  ([row col]
   (screen screen-offset row col))
  ([offset row col]
   (let [word (+ (* 32 row) (/ col 16) offset)
         bit (mod col 16)]
     [(int word) bit])))

(comment

  ;; Direct to Screen
  (screen 0 4 55)
  ;; => [131 7]

  ;; Memory-mapped Screen
  (screen 4 55)
  ;; => [16515 7]

  )
