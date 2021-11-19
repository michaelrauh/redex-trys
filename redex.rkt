#lang racket
(require redex)

(define-language addition
  [N 0
     1
     2
     (+ N N)]
  [C (+ C N)
     hole])

(define addition-red
  (reduction-relation
   addition
   (--> (in-hole C (+ N 0))
        (in-hole C N)
        n-and-zero-is-zero)
   (--> (in-hole C (+ 0 N))
        (in-hole C N)
        zero-and-n-is-zero)
   (--> (in-hole C (+ 1 1))
        (in-hole C 2)
        one-and-one-is-two)
   (--> (in-hole C (+ 1 2))
        (in-hole C 0)
        one-and-two-is-zero)
   (--> (in-hole C (+ 2 1))
        (in-hole C 0)
        two-and-one-is-zero)
   (--> (in-hole C (+ 2 2))
        (in-hole C 1)
        two-and-two-is-one)))

(traces addition-red (term (+ (+ 1 2) (+ (+ 1 2) (+ 1 1)))))