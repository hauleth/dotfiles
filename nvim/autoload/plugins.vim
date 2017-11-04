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
    call minpac#add('rust-lang/rust.vim')
    call minpac#add('dag/vim-fish')
    call minpac#add('cespare/vim-toml')
    call minpac#add('elixir-lang/vim-elixir')
    call minpac#add('hashivim/vim-hashicorp-tools')
    call minpac#add('posva/vim-vue')
    " }}}
    " Git {{{
    " call minpac#add('lambdalisue/gina.vim')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('idanarye/vim-merginal')
    " }}}
    " Project navigation {{{
    call minpac#add('junegunn/fzf')
    call minpac#add('tpope/vim-projectionist')
    call minpac#add('direnv/direnv.vim')
    " }}}
    " File manager {{{
    call minpac#add('justinmk/vim-dirvish')
    call minpac#add('tpope/vim-eunuch')
    " }}}
    " Completion {{{
    call minpac#add('roxma/nvim-completion-manager')
    call minpac#add('racer-rust/vim-racer')
    call minpac#add('roxma/nvim-cm-racer')
    call minpac#add('slashmili/alchemist.vim')
    " }}}
    " Code manipulation {{{
    call minpac#add('mjbrownie/swapit')
    call minpac#add('jiangmiao/auto-pairs')
    call minpac#add('tommcdo/vim-exchange')
    call minpac#add('tommcdo/vim-lion')
    call minpac#add('tpope/vim-commentary')
    call minpac#add('tpope/vim-endwise')
    call minpac#add('tpope/vim-surround')
    call minpac#add('AndrewRadev/splitjoin.vim')
    call minpac#add('hauleth/sad.vim')
    " }}}
    " Task running & quickfix {{{
    call minpac#add('skywind3000/asyncrun.vim')
    call minpac#add('romainl/vim-qf')
    call minpac#add('romainl/vim-qlist')
    " }}}
    " Utils {{{
    call minpac#add('wellle/targets.vim')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tpope/vim-unimpaired')
    call minpac#add('wakatime/vim-wakatime')
    " }}}
endfunc

" Helpers

func! s:install_skim(...) abort
    if has(':AsyncRun')
        noautocmd AsyncRun! ./install --bin
    else
        ! ./install --bin
    endif
endfunc
