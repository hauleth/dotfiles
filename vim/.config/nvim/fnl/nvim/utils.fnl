(global __nvim_functions__ {})

(fn maybe-join [value]
  (if (= (type value) :table)
      (table.concat value ",")
      value))

(fn make-func [func]
  (let [idx (+ (length __nvim_functions__) 1)]
    (tset __nvim_functions__ idx func)
    (.. "__nvim_functions__[" idx "]")))

{: maybe-join
 : make-func}
