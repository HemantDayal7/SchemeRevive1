(module sn-social-network racket

  (provide 
   sn-ff-for
   sn-cmn-frnds-btwn
   sn-cmn-frnds
   sn-frnd-cnt
   sn-frndlst-user
   sn-unfrndlst-user  )

  (require "sn-graph.rkt")
  (require "sn-utils.rkt")
  
  ;; social-network.
  ;; Easy
  ;; [(k,v)]| (u,vu) -> vu
  (define (sn-ff-for graph u)
  (cond
    [(dict-has-key? graph u) (dict-ref graph u '())]
    [else '()]))
    ;(/ 1 0))


  ;; Medium
  ;; [(k,v)]|(u1,f1)|(u2,f2) ->
  ;; f2 & f3
  (define (sn-cmn-frnds-btwn graph u1 u2)
  (let* ((friends1 (sn-ff-for graph u1))
         (friends2 (sn-ff-for graph u2)))
    (filter (lambda (f) (member f friends1))
            friends2)))
    ;(/ 1 0) )

  
  ;; Hard
  (define (sn-frnd-cnt graph)
  (let ([users (sn-users graph)])
    (map (lambda (user)
           (cons user (length (dict-ref graph user))))
         users))) 
    ;( / 1 0))

  ;; pre: length > 0 
  ;; sn-frndlst-user
;; [(k,v)] -> (k . n)
;; Medium
(define (sn-frndlst-user graph)
  (let* ((users (sn-users graph))
         (friends-counts (map (lambda (user) (cons user (length (dict-ref graph user)))) users))
         (max-friends (apply max (map cdr friends-counts)))
         (user-with-max-friends (car (filter (lambda (p) (= (cdr p) max-friends)) friends-counts))))
    user-with-max-friends))

  ;(/ 1 0))
              
          
  ;; pre: length > 0
  (define (sn-unfrndlst-user graph)
  (let* ((users (sn-users graph))
         (user-friend-counts (map (lambda (user) (cons user (length (dict-ref graph user '())))) users))
         (sorted-user-friend-counts (sort user-friend-counts (lambda (x y) (< (cdr x) (cdr y))))))
    (car sorted-user-friend-counts)))

    ;(/ 1 0))

  ;; this is for free. Do not mdify (ROM)
  (define (sn-cmn-frnds-ff graph u)
    (let*
        ([keys (sn-users graph)]
         [vals (map
                (lambda (key)
                  (sn-cmn-frnds-btwn graph u key))
                keys)]
       
         )
      (sn-dict-ks-vs keys vals)))


  ;; this is for free. Do not mdify (ROM)
  (define (sn-cmn-frnds graph )
    (let*
        ([keys (sn-users graph)]
         [vals (map
                (lambda (key)
                  (sn-cmn-frnds-ff graph key))
                keys)]
         )
      (sn-dict-ks-vs keys vals)))

  )

