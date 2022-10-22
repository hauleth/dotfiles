(import-macros {: use} :relude)

(use telescope)
(use telescope.themes)

(let [opts {:vimgrep_arguments [:rg
                                :--vimgrep
                                :--smart-case
                                :--hidden
                                :--glob=!.git]}]
  (telescope.setup {:defaults (themes.get_dropdown opts)}))

(telescope.load_extension :fzy_native)

(fn finder [name]
  (. (require :telescope.builtin) name))

(fn find_files [opts]
  (let [defaults {:find_command [:rg
                                 :--hidden
                                 :--ignore
                                 :--files
                                 :--glob=!.git
                                 :--glob=!*.lock]
                  :previewer false}
        options (vim.tbl_extend :force defaults (or opts {}))]
    ((finder :find_files) options)))

(setmetatable {: find_files}
              {:__index (fn [_ key]
                          (finder key))})
