(fn inspect [data]
  `(let [v# ,data]
     (when vim.g.debug
       (print (fennel.view v#)))
     v#))

{: inspect}
