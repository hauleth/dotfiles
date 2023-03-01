(fn compile-heurestic [spec]
  (let [wrap #(if (= (type $1) :table) $1 [$1])]
    (table.concat (icollect [_ v (ipairs (wrap spec))] (table.concat (wrap v) "&")) "|")))

(fn projection [guards spec]
  ; Guard for empty variable
  (let [heurestic (compile-heurestic guards)]
    (when (= vim.g.projectionist_heuristics nil) (set vim.g.projectionist_heuristics {}))
    {heurestic spec}))

(fn template [name]
  (let [[name] (vim.api.nvim_get_runtime_file (.. "templates/" name ".tpl") false)]
    (vim.fn.readfile name)))

{: projection : template}
