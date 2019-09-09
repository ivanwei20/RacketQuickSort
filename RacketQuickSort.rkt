#lang racket
(require racket/vector)

(provide quickSort)

; Returns the lower partition of the vector being sorted
(define (returnLessThan vec pivot)
  (define (lessThanPivot num)(< num pivot))
  (vector-filter (compose1 lessThanPivot) vec) 
)

; Returns the upper partition of the vector being sorted
(define (returnMoreThan vec pivot)
  (define (moreThanPivot num)(> num pivot))
  (vector-filter (compose1 moreThanPivot) vec) 
)

; Returns a vector containing all instances of the pivot in the vector being sorted
(define (returnEqualTo vec pivot)
  (define (equalToPivot num)(= num pivot))
  (vector-filter (compose1 equalToPivot) vec) 
)

; Main sort procedure
(define (quickSort vec)
  (define returnVector (make-vector (vector-length vec)))
  
   ; Checks if there are multiple elements in the vector
  (if (> (vector-length vec) 1)(
    (lambda ()
      (define pivot (vector-ref vec 0))
      (define partition1 (returnLessThan vec pivot))
      (define partition2 (returnMoreThan vec pivot))

      ; Recursively sorts the partitions
      (set! partition1 (quickSort partition1))
      (set! partition2 (quickSort partition2))
    
      ; Combines the partitions and the pivot and returns the result
      (set! returnVector (vector-append partition1 (returnEqualTo vec pivot) partition2))
    )
  )
    ; Otherwise, there is 1 or no elements
    ; In consequence, there is no need to sort the vector, so the original is returned
    (set! returnVector vec)
  )

  returnVector
)