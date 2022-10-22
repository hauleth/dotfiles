(import-macros {: use} :relude)

(use packer)

(fn config [cb]
 (packer.startup
  (fn [-pkg -pkg-rocks]
   (let [super (fn [f] (fn [name ?opts] (f (vim.tbl_extend :keep {1 name} (or ?opts {})))))
         pkg (super -pkg)
         pkg-rocks (super -pkg-rocks)]
    (cb pkg pkg-rocks)))))

(config (fn [pkg pkg-rocks]
          ; Color scheme
          ; (pkg :hauleth/blame.vim)
          ; Project navigation
          (pkg :tpope/vim-projectionist)
          (pkg :justinmk/vim-dirvish)
          (pkg :tpope/vim-eunuch)

          ; File picker
          (pkg :nvim-lua/popup.nvim)
          (pkg :nvim-lua/plenary.nvim)
          (pkg :nvim-telescope/telescope.nvim)
          (pkg :nvim-telescope/telescope-fzy-native.nvim)

          ; Git
          (pkg :tpope/vim-fugitive)
          (pkg :pwntester/octo.nvim)

          ; Launch screen
          (pkg :mhinz/vim-startify)

          ; Languages
          (pkg :elixir-editors/vim-elixir)
          ;(pkg :nvim-orgmode/orgmode)

          ; Tree Sitter
          (pkg :neovim/nvim-lspconfig)
          (pkg :nvim-treesitter/playground)

          ; Code manipulation
          (pkg :AndrewRadev/splitjoin.vim)
          (pkg :hauleth/sad.vim)
          (pkg :tommcdo/vim-exchange)
          (pkg :tommcdo/vim-lion)
          (pkg :tpope/vim-commentary)
          (pkg :machakann/vim-sandwich {:opt true})

          ; Movements
          (pkg :wellle/targets.vim {:opt true})
          (pkg :rhysd/clever-f.vim)

          ; Task running
          (pkg :hauleth/asyncdo.vim)
          (pkg :romainl/vim-qf)
          (pkg :romainl/vim-qlist)
          (pkg :Olical/vim-enmasse)
          (pkg :igemnace/vim-makery)

          ; Windows
          (pkg :t9md/vim-choosewin)

          ; Utils
          (pkg :andymass/vim-matchup)
          (pkg :direnv/direnv.vim)
          (pkg :hauleth/vim-backscratch)
          (pkg :https://gitlab.com/hauleth/qfx.vim.git)
          (pkg :https://gitlab.com/hauleth/smart.vim.git)
          (pkg :sgur/vim-editorconfig)
          (pkg :mbbill/undotree)
          (pkg :tpope/vim-characterize)
          (pkg :tpope/vim-dadbod)
          (pkg :tpope/vim-repeat)
          (pkg :tpope/vim-rsi)
          (pkg :andweeb/presence.nvim)
          (pkg :j-hui/fidget.nvim)
          ))
