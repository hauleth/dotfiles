" vi: foldmethod=marker foldlevel=0
let s:current_file = expand('<sfile>')
let s:data_dir = exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . '/.local/share'

let s:dir = s:data_dir . '/nvim/site'

if !exists('*plugins#reload')
    func! plugins#reload() abort
        exec 'source ' . s:current_file

        call plugins#spec()
    endfunc
endif

func! plugins#spec() abort
    packadd minpac

    if !exists('g:minpac')
        call minpac#init({'dir': s:dir})
    endif

    " Package manager {{{
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    " }}}
    " Colorscheme {{{
    call minpac#add('hauleth/blame.vim') " colorscheme
    call minpac#add('dylanaraps/wal.vim') " colorscheme
    " }}}
    " Project navigation {{{
    call minpac#add('tpope/vim-projectionist') " Requires access to VimEnter
    call minpac#add('justinmk/vim-dirvish') " Required for opening directories
    call minpac#add('tpope/vim-eunuch')
    call minpac#add('nvim-lua/popup.nvim')
    call minpac#add('nvim-lua/plenary.nvim')
    call minpac#add('nvim-telescope/telescope.nvim')
    call minpac#add('nvim-telescope/telescope-fzy-native.nvim')
    " }}}
    " Git {{{
    call minpac#add('tpope/vim-fugitive')
    " call minpac#add('TimUntersberger/neogit')
    " call minpac#add('nvim-lua/popup.nvim')
    " call minpac#add('nvim-lua/plenary.nvim')
    " call minpac#add('pwntester/octo.nvim')
    " }}}
    " Launch screen {{{
    call minpac#add('mhinz/vim-startify') " Required during startup
    " }}}
    " Languages {{{
    call minpac#add('aklt/plantuml-syntax') " ftplugin
    call minpac#add('cespare/vim-toml') " ftplugin
    call minpac#add('dag/vim-fish') " ftplugin
    call minpac#add('hauleth/vim-elixir', {'branch': 'fix/encode-all-db-options'}) " ftplugin
    call minpac#add('pangloss/vim-javascript') " ftplugin
    call minpac#add('tpope/vim-cucumber') " ftplugin
    call minpac#add('tpope/vim-scriptease', {'type': 'opt'}) " ftplugin
    call minpac#add('LnL7/vim-nix')
    call minpac#add('bakpakin/fennel.vim')
    call minpac#add('nvim-treesitter/nvim-treesitter')
    " }}}
    " Completion {{{
    " call minpac#add('prabirshrestha/async.vim') " autoload-only
    " call minpac#add('prabirshrestha/vim-lsp')
    call minpac#add('Shougo/echodoc.vim')
    call minpac#add('fcpg/vim-complimentary') " autoload-only
    call minpac#add('neovim/nvim-lspconfig')
    " }}}
    " Code manipulation {{{
    call minpac#add('AndrewRadev/splitjoin.vim', {'rev': 'main'})
    call minpac#add('hauleth/sad.vim')
    call minpac#add('tommcdo/vim-exchange')
    call minpac#add('tommcdo/vim-lion')
    call minpac#add('tpope/vim-commentary')
    call minpac#add('tpope/vim-endwise') " Requires access to au FileType
    call minpac#add('machakann/vim-sandwich', {'type': 'opt'})
    " }}}
    " Movements {{{
    call minpac#add('wellle/targets.vim', {'type': 'opt'})
    call minpac#add('rhysd/clever-f.vim')
    call minpac#add('edkolev/erlang-motions.vim')
    " }}}
    " Task running & quickfix {{{
    call minpac#add('hauleth/asyncdo.vim')
    call minpac#add('romainl/vim-qf')
    call minpac#add('romainl/vim-qlist')
    call minpac#add('Olical/vim-enmasse')
    call minpac#add('igemnace/vim-makery')
    " }}}
    " Splits management {{{
    call minpac#add('t9md/vim-choosewin')
    " }}}
    " Utils {{{
    call minpac#add('andymass/vim-matchup')
    call minpac#add('direnv/direnv.vim')
    call minpac#add('hauleth/vim-backscratch')
    call minpac#add('https://gitlab.com/hauleth/qfx.vim.git')
    call minpac#add('https://gitlab.com/hauleth/smart.vim.git')
    call minpac#add('reedes/vim-pencil')
    call minpac#add('sgur/vim-editorconfig') " Required during startup
    call minpac#add('mbbill/undotree')
    call minpac#add('tpope/vim-characterize')
    call minpac#add('tpope/vim-dadbod')
    call minpac#add('tpope/vim-repeat') " autoload-only plugin
    call minpac#add('tpope/vim-rsi')
    call minpac#add('vimwiki/vimwiki')
    " }}}
endfunc
