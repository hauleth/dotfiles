(fn inspect [data]
  `(let [v# ,data]
     (when vim.g.debug
       (print (vim.inspect v#)))
     v#))

{: inspect}
