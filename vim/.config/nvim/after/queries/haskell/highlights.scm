;; extends

(((type) @type) (#eq? @type "Integer") (#set! conceal "ℤ"))
(((type) @type) (#eq? @type "Rational") (#set! conceal "ℚ"))

("\\" @operator (#set! conceal "λ"))
("forall" @repeat (#set! conceal "∀"))
((where) @keyword (#set! conceal "∵"))

((exp_infix (variable) @operator) (#eq? @operator "in") (#set! conceal "∈"))
(((operator) @operator) (#eq? @operator ".") (#set! conceal "∘"))
