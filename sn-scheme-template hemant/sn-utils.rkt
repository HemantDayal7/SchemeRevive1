;; Define a module named 'sn-utils' in the Racket language
(module sn-utils racket

  ;; Export the following functions from the module:
  (provide sn-dict-ks-vs
           sn-line->entry
           sn-list->dict)

  ;; Define a function that takes two lists of keys and values, and returns a dictionary
  ;; that maps each key to its corresponding value. The keys and values are paired up
  ;; using the 'map' and 'cons' functions.
  ;; [k] [v] -> [(k,v)]
  (define (sn-dict-ks-vs ks vs)
    (sn-list->dict (map cons ks vs)))

  ;; Define a function that takes a string and returns a pair containing the first word
  ;; (converted to a symbol) and the remaining words (converted to symbols).
  ;; str -> (a,[a])
  (define (sn-line->entry str)
    (let ((lst (string-split str))) ; split the string into a list of words
      (cons (string->symbol (car lst)) ; convert the first word to a symbol and make it the first element of the pair
            (map string->symbol (cdr lst))))) ; convert the remaining words to symbols and make them the second element of the pair

  ;; Define a function that takes a list of pairs and returns a dictionary that maps each
  ;; pair's first element to its second element. Since the input is already in the format
  ;; expected by the dictionary, this function simply returns the input unchanged.
  ;; [(a,b)] -> [(a,b)]
  (define (sn-list->dict es)
    es)
)
