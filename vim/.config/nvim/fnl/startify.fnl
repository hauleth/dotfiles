(import-macros {: g} :nvim.macros)

(fn setup [opts]
  (each [k v (pairs opts)]
    (g (.. "startify_" (k:gsub "-" "_")) v)))

{: setup}
