(local packer (require :packer))

(fn config [cb]
 (packer.startup
  (fn [-use -use-rocks]
   (let [super (fn [f] (fn [name ?opts] (f (vim.tbl_extend :keep {1 name} (or ?opts {})))))
         use (super -use)
         use-rocks (super -use-rocks)]
    (cb use use-rocks)))))

(config (fn [use use-rocks]
          ; Speedup initialisation
          (use :lewis6991/impatient.nvim)
          ; Package manager
          (use :wbthomason/packer.nvim)
          ; Color scheme
          (use :hauleth/blame.vim)
          ; Project navigation
          (use :tpope/vim-projectionist)
          (use :justinmk/vim-dirvish)
          (use :tpope/vim-eunuch)

          ; File picker
          (use :nvim-lua/popup.nvim)
          (use :nvim-lua/plenary.nvim)
          (use :nvim-telescope/telescope.nvim)
          (use :nvim-telescope/telescope-fzy-native.nvim)

          ; Git
          (use :tpope/vim-fugitive)
          (use :pwntester/octo.nvim)

          ; Launch screen
          (use :mhinz/vim-startify)

          ; Languages
          (use :elixir-editors/vim-elixir)
          (use :nvim-treesitter/nvim-treesitter)
          (use :lepture/vim-jinja)
          ;(use :nvim-orgmode/orgmode)

          ; Tree Sitter
          (use :neovim/nvim-lspconfig)
          (use :nvim-treesitter/playground)

          ; Code manipulation
          (use :AndrewRadev/splitjoin.vim)
          (use :hauleth/sad.vim)
          (use :tommcdo/vim-exchange)
          (use :tommcdo/vim-lion)
          (use :tpope/vim-commentary)
          (use :machakann/vim-sandwich {:opt true})
          (use :hrsh7th/cmp-nvim-lsp)
          (use :hrsh7th/cmp-buffer)
          (use :hrsh7th/nvim-cmp)
          ; (use :L3MON4D3/LuaSnip)
          ; (use :saadparwaiz1/cmp_luasnip)

          ; Movements
          (use :wellle/targets.vim {:opt true})
          (use :rhysd/clever-f.vim)

          ; Task running
          (use :hauleth/asyncdo.vim)
          (use :romainl/vim-qf)
          (use :romainl/vim-qlist)
          (use :Olical/vim-enmasse)
          (use :igemnace/vim-makery)

          ; Windows
          (use :t9md/vim-choosewin)

          ; Utils
          (use :andymass/vim-matchup)
          (use :direnv/direnv.vim)
          (use :hauleth/vim-backscratch)
          (use :https://gitlab.com/hauleth/qfx.vim.git)
          (use :https://gitlab.com/hauleth/smart.vim.git)
          (use :sgur/vim-editorconfig)
          (use :mbbill/undotree)
          (use :tpope/vim-characterize)
          (use :tpope/vim-dadbod)
          (use :tpope/vim-repeat)
          (use :tpope/vim-rsi)
          ))
