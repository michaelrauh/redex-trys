#lang racket
(require redex)

(define-language addition
  [N 0
     1
     2
     (+ N N)]
  [C (+ C N)
     (+ N C)
     hole])

(define addition-red
  (reduction-relation
   addition
   (--> (in-hole C (+ 0 N))
        (in-hole C N)
        n-0)))

(traces addition-red (term (+ 0 2)))