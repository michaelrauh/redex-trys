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
   (--> (in-hole C (+ N 0))
        (in-hole C N)
        n-0n)
   (--> (in-hole C (+ 0 N))
        (in-hole C N)
        n-n0)
   (--> (in-hole C (+ 1 1))
        (in-hole C 2)
        n-112)
   (--> (in-hole C (+ 1 2))
        (in-hole C 0)
        n-120)
   (--> (in-hole C (+ 2 1))
        (in-hole C 0)
        n-210)
   (--> (in-hole C (+ 2 2))
        (in-hole C 1)
        n-221)))

(traces addition-red (term (+ (+ (+ (+ 1 0) (+ 0 1)) (+ 2 1)) (+ 1 2))))