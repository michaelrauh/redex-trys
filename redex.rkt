#lang racket
(require redex)
(define-language bool-any-lang
  [B true
     false
     (v B B)]
  [C (v C B)
     (v B C)
     hole])

(define-language addition
  [N 0
     1
     2
     (+ N N)]
  [C (+ C N)
     (+ N C)
     hole])

(redex-match addition
             (in-hole C (+ 1 N))
             (term (+ 1 2)))

(define addition-red
  (reduction-relation
   addition
   (--> (in-hole C (+ 0 N))
        (in-hole C N)
        n-0)))

(traces addition-red (term (+ 0 2)))