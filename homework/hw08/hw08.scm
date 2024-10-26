(define (ascending? s)
        (if (null? s)
            #t
            (if (null? (cdr s))
                #t
                (if (ascending? (cdr s))
                    (if (<= (car s) (car (cdr s)))
                        #t
                        #f
                    )
                    #f
                )
            )
            
        )
)

(define (my-filter pred s)
        (if (null? s) 
            '()
            (append (if (pred (car s))
                            (list(car s))
                            '()) 
                        (my-filter pred (cdr s))
            )
        )
)

(define (interleave lst1 lst2)
        (cond   ((null? lst1) lst2)
                ((null? lst2) lst1)
                (else (append (list(car lst1)) (list(car lst2)) (interleave (cdr lst1) (cdr lst2)))))
)

(define (no-repeats s)
        (cond   ((null? s) '())
                ((null? (cdr s)) s)
                (else (append (list(car s)) (filter (lambda (a) (not (= (car s) a))) (no-repeats (cdr s)))))
        )
)
