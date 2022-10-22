(fn setup [opts]
  (each [k v (pairs opts)]
    (tset vim.g (.. :startify_ (k:gsub "-" "_")) v)))

{: setup}
