#lang racket
(require (relative-in "../RacketQuickSort.rkt"))
(make-pseudo-random-generator)

(define v (vector (random 0 15) (random 0 15) (random 0 15) (random 0 15) (random 0 15)))
(print "Unsorted Vector:")(println v)
(print "Sorted Vector:")(println (quickSort v))