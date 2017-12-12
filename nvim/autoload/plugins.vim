" vi: foldmethod=marker
let s:current_file = expand('<sfile>')

if !exists('*plugins#reload')
    func! plugins#reload() abort
        exec 'source ' . s:current_file

        call plugins#spec()
    endfunc
endif

func! plugins#spec() abort
    packadd minpac

    echom 'Load minpac spec'

    call minpac#init()
    " Package manager {{{
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    " }}}
    " Colorscheme {{{
    call minpac#add('hauleth/blame.vim')
    " }}}
    " Launch screen {{{
    call minpac#add('mhinz/vim-startify')
    " }}}
    " Languages {{{
    call minpac#add('cespare/vim-toml')
    call minpac#add('dag/vim-fish')
    call minpac#add('elixir-lang/vim-elixir')
    call minpac#add('pangloss/vim-javascript')
    call minpac#add('tsandall/vim-rego')
    call minpac#add('posva/vim-vue')
    " }}}
    " Git {{{
    call minpac#add('lambdalisue/gina.vim')
    " }}}
    " Project navigation {{{
    call minpac#add('tpope/vim-projectionist')
    " }}}
    " File manager {{{
    call minpac#add('justinmk/vim-dirvish')
    call minpac#add('tpope/vim-eunuch', {'type': 'opt'})
    " }}}
    " Completion {{{
    call minpac#add('prabirshrestha/async.vim')
    call minpac#add('prabirshrestha/vim-lsp', {'type': 'opt'})
    call minpac#add('Shougo/echodoc.vim', {'type': 'opt'})
    call minpac#add('fcpg/vim-complimentary', {'type': 'opt'})
    " }}}
    " Code manipulation {{{
    call minpac#add('AndrewRadev/splitjoin.vim', {'type': 'opt'})
    call minpac#add('hauleth/sad.vim', {'type': 'opt'})
    call minpac#add('jiangmiao/auto-pairs', {'type': 'opt'})
    call minpac#add('mjbrownie/swapit')
    call minpac#add('tommcdo/vim-exchange', {'type': 'opt'})
    call minpac#add('tommcdo/vim-lion', {'type': 'opt'})
    call minpac#add('tpope/vim-commentary', {'type': 'opt'})
    call minpac#add('tpope/vim-endwise', {'type': 'opt'})
    call minpac#add('tpope/vim-surround', {'type': 'opt'})
    " }}}
    " Task running & quickfix {{{
    call minpac#add('hauleth/asyncdo.vim', {'type': 'opt'})
    call minpac#add('romainl/vim-qf', {'type': 'opt'})
    call minpac#add('romainl/vim-qlist', {'type': 'opt'})
    " }}}
    " Utils {{{
    call minpac#add('Olical/vim-enmasse', {'type': 'opt'})
    call minpac#add('tpope/vim-repeat', {'type': 'opt'})
    call minpac#add('tpope/vim-unimpaired', {'type': 'opt'})
    call minpac#add('wellle/targets.vim', {'type': 'opt'})
    call minpac#add('t9md/vim-choosewin', {'type': 'opt'})
    call minpac#add('machakann/vim-highlightedyank', {'type': 'opt'})
    call minpac#add('yangmillstheory/vim-snipe', {'type': 'opt'})
    call minpac#add('direnv/direnv.vim')
    " }}}
endfunc
