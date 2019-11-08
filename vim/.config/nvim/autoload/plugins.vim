" vi: foldmethod=marker foldlevel=0
let s:current_file = expand('<sfile>')
let s:data_dir = exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . '/.local/share'

let s:dir = s:data_dir . '/nvim/site/pack/packager'

if !exists('*plugins#reload')
    func! plugins#reload() abort
        exec 'source ' . s:current_file

        call plugins#spec()
    endfunc
endif

func! plugins#spec() abort
    packadd vim-packager

    if !exists('g:packager')
        call packager#init({'dir': s:dir})
    endif

    " Package manager {{{
    call packager#add('kristijanhusak/vim-packager', {'type': 'opt'})
    " }}}
    " Colorscheme {{{
    call packager#add('hauleth/blame.vim') " colorscheme
    call packager#add('dylanaraps/wal.vim') " colorscheme
    " }}}
    " Project navigation {{{
    call packager#add('tpope/vim-projectionist') " Requires access to VimEnter
    call packager#add('srstevenson/vim-picker')
    call packager#add('justinmk/vim-dirvish') " Required for opening directories
    call packager#add('tpope/vim-eunuch')
    " }}}
    " Git {{{
    call packager#add('tpope/vim-fugitive', { 'type': 'opt' })
    " }}}
    " Launch screen {{{
    call packager#add('mhinz/vim-startify') " Required during startup
    " }}}
    " Languages {{{
    call packager#add('aklt/plantuml-syntax') " ftplugin
    call packager#add('b4b4r07/vim-hcl') " ftplugin
    call packager#add('cespare/vim-toml') " ftplugin
    call packager#add('dag/vim-fish') " ftplugin
    call packager#add('elixir-lang/vim-elixir') " ftplugin
    call packager#add('pangloss/vim-javascript') " ftplugin
    call packager#add('tpope/vim-cucumber') " ftplugin
    call packager#add('tpope/vim-scriptease', {'type': 'opt'}) " ftplugin
    call packager#add('LnL7/vim-nix')
    " }}}
    " Completion {{{
    call packager#add('prabirshrestha/async.vim') " autoload-only
    call packager#add('prabirshrestha/vim-lsp')
    call packager#add('Shougo/echodoc.vim')
    call packager#add('fcpg/vim-complimentary') " autoload-only
    " }}}
    " Code manipulation {{{
    call packager#add('AndrewRadev/splitjoin.vim')
    call packager#add('hauleth/sad.vim')
    call packager#add('tommcdo/vim-exchange')
    call packager#add('tommcdo/vim-lion')
    call packager#add('tpope/vim-commentary')
    call packager#add('tpope/vim-endwise') " Requires access to au FileType
    call packager#add('machakann/vim-sandwich', {'type': 'opt'})
    " }}}
    " Movements {{{
    call packager#add('wellle/targets.vim', {'type': 'opt'})
    call packager#add('rhysd/clever-f.vim')
    call packager#add('edkolev/erlang-motions.vim')
    " }}}
    " Task running & quickfix {{{
    call packager#add('hauleth/asyncdo.vim')
    call packager#add('romainl/vim-qf')
    call packager#add('romainl/vim-qlist')
    call packager#add('Olical/vim-enmasse')
    call packager#add('igemnace/vim-makery')
    " }}}
    " Splits management {{{
    call packager#add('t9md/vim-choosewin')
    " }}}
    " Utils {{{
    call packager#add('andymass/vim-matchup')
    call packager#add('tpope/vim-repeat') " autoload-only plugin
    call packager#add('tpope/vim-unimpaired', {'type': 'opt'})
    call packager#add('tpope/vim-rsi')
    call packager#add('direnv/direnv.vim')
    call packager#add('sgur/vim-editorconfig') " Required during startup
    call packager#add('tpope/vim-characterize')
    call packager#add('https://gitlab.com/hauleth/qfx.vim.git')
    call packager#add('hauleth/vim-backscratch')
    call packager#add('tpope/vim-dadbod')
    call packager#add('https://gitlab.com/hauleth/smart.vim.git')
    " }}}
endfunc
