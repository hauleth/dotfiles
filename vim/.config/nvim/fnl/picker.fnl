(import-macros {: use} :relude)

(use nvim {: cmd})

(fn finder [name]
  (use telescope)
  (use telescope.themes)

  (let [opts {:vimgrep_arguments [:rg
                                   :--vimgrep
                                   :--smart-case
                                   :--hidden
                                   :--glob=!.git]}]
    (telescope.setup {:defaults (themes.get_dropdown opts)}))

  (telescope.load_extension :zf-native)
  (. (require :telescope.builtin) name))

(fn find-files [opts]
  (let [defaults {:find_command [:rg
                                  :--hidden
                                  :--ignore
                                  :--files
                                  :--glob=!.git
                                  :--glob=!*.lock]
                 :previewer false}
                 options (vim.tbl_extend :force defaults (or opts {}))]
    ((finder :find_files) options)))

(setmetatable {: find-files}
              {:__index (fn [_ key]
                          (finder key))})
