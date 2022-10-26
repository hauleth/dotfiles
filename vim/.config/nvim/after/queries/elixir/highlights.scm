;; extends

(call target: ((identifier) @_test (#any-of? @_test
  "assert" "test" "describe"
)))

(sigil
  "~"
  (sigil_name) @_sigil_name
  (quoted_content) @string.special
  (#any-of? @_sigil_name "w" "W" "c" "C"))
