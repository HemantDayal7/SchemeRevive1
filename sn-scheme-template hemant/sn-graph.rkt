;; Define a module named 'sn-graph' in the Racket language
(module sn-graph racket

  ;; Export the following functions from the module:
  (provide sn-consistent
           sn-empty
           sn-add-user
           sn-users
           sn-add-frndshp)

  ;; Required library - allows for the use of dictionaries in the code
  (require racket/dict)

  ;; Determines if the social network graph is consistent
  ;; (This function is currently not implemented and simply returns #t)
  (define (sn-consistent p) #t)

  ;; Returns an empty social network graph (represented as an empty dictionary)
  (define sn-empty
    empty)

  ;; Returns a list of all the users in the social network graph
  (define (sn-users graph)
    (dict-keys graph))

  ;; Adds a user to the social network graph if they are not already present
  (define (sn-add-user network user-id)
    (cond ((member user-id network) network) ; if user already exists, return network unchanged
          (else (cons (list user-id) network)))) ; otherwise, add user to network

  ;; Adds a friendship connection between two users in the social network graph
  ;; If either of the users does not exist in the graph, they are added
  (define (sn-add-frndshp graph u1 u2)
    (let ((friend1 (dict-ref graph u1 '())) ; retrieve the list of friends for user 1 (or an empty list if user 1 is not yet in the graph)
          (friend2 (dict-ref graph u2 '()))) ; retrieve the list of friends for user 2 (or an empty list if user 2 is not yet in the graph)
      (dict-set graph u1 (append friend1 (list u2))) ; add user 2 to user 1's list of friends
      (dict-set graph u2 (append friend2 (list u1)))) ; add user 1 to user 2's list of friends
  )
)
