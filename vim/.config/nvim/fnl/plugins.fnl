(import-macros {: use} :relude)

(use packer)

(fn config [cb]
  (packer.startup (fn [-pkg]
                    (let [super (fn [f]
                                  (fn [name ?opts]
                                    (f (vim.tbl_extend :keep {1 name}
                                                       (or ?opts {})))))
                          pkg (super -pkg)]
                      (cb pkg)))
                  {:options {}}))

;; fnlfmt: skip
(config (fn [pkg pkg-rocks]
          ; Color scheme
          ; (pkg :hauleth/blame.vim)

          (pkg :echasnovski/mini.nvim)

          ; Project navigation
          (pkg :tpope/vim-projectionist)
          (pkg :justinmk/vim-dirvish)
          (pkg :tpope/vim-eunuch)

          ; File picker
          (pkg :nvim-telescope/telescope.nvim {
               :opt true
               :requires [(pkg :natecraddock/telescope-zf-native.nvim)
                          (pkg :nvim-lua/plenary.nvim)]})

          ; Git
          (pkg :tpope/vim-fugitive)

          ; Languages
          (pkg :elixir-editors/vim-elixir
               {:ft [:elixir :eex :heex]})
          ;(pkg :nvim-orgmode/orgmode)

          ; Language Protocol
          (pkg :neovim/nvim-lspconfig)
          (pkg :nvim-treesitter/playground
               {:cmd [:TSPlaygroundToggle
                      :TSHighlightCaputresUnderCursor]})
          (pkg :j-hui/fidget.nvim {:opt true})

          ; Code manipulation
          (pkg :AndrewRadev/splitjoin.vim
               {:keys [:gS :gJ]})
          (pkg :hauleth/sad.vim)
          (pkg :tommcdo/vim-exchange)

          ; Task running
          (pkg :hauleth/asyncdo.vim)
          (pkg :romainl/vim-qf
               {:ft [:qf]
                :event [:QuickFixCmdPre]})
          (pkg :romainl/vim-qlist
               {:ft [:qf]
                :event [:QuickFixCmdPre]})
          (pkg :Olical/vim-enmasse
               {:cmd [:EnMasse]
                :ft [:qf]})
          (pkg :igemnace/vim-makery)

          ; Windows
          (pkg :t9md/vim-choosewin
               {:keys ["<plug>(choosewin)"]})

          ; Utils
          (pkg :andymass/vim-matchup)
          (pkg :direnv/direnv.vim)
          (pkg :hauleth/vim-backscratch {:cmd [:Scratch]})
          (pkg "https://gitlab.com/hauleth/qfx.vim.git")
          (pkg "https://gitlab.com/hauleth/smart.vim.git")
          (pkg :sgur/vim-editorconfig)
          (pkg :mbbill/undotree
               {:cmd [:UndotreeShow :UndotreeToggle]})
          (pkg :tpope/vim-characterize {:keys [:ga]})
          (pkg :tpope/vim-dadbod {:cmd [:DB]})
          (pkg :tpope/vim-repeat)
          (pkg :tpope/vim-rsi)))
