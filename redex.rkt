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
        (in-hole C (+ N 0))
        s0)
   (--> (in-hole C (+ 1 N))
        (in-hole C (+ N 1))
        s1)
   (--> (in-hole C (+ 2 N))
        (in-hole C (+ N 2))
        s2)
   (--> (in-hole C (succ 0))
        (in-hole C 1)
        s01)
   (--> (in-hole C (succ 1))
        (in-hole C 2)
        s12)
   (--> (in-hole C (succ 2))
        (in-hole C 0)
        s20)
   (--> (in-hole C (+ N 1))
        (in-hole C (succ N))
        n-n1s)
   (--> (in-hole C (+ N 2))
        (in-hole C (succ (+ N 1)))
        sn2)))

(traces addition-red (term (+ (+ (+ (+ 1 0) (+ 0 1)) (+ 2 1)) (+ 1 2))))