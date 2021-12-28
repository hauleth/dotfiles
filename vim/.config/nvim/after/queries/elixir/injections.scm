(unary_operator
  operator: "@"
  operand: (call
    target: ((identifier) @_identifier)
    (arguments [
      (string) @markdown
      (sigil
        _
        (quoted_content) @markdown)]))
  (#any-of? @_identifier "moduledoc" "typedoc" "shortdoc" "doc"))
