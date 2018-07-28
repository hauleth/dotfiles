" vi: foldmethod=marker foldlevel=0
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
    call minpac#add('hauleth/blame.vim') " colorscheme
    " }}}
    " Launch screen {{{
    call minpac#add('mhinz/vim-startify') " Required during startup
    " }}}
    " Languages {{{
    call minpac#add('cespare/vim-toml') " ftplugin
    call minpac#add('dag/vim-fish') " ftplugin
    call minpac#add('elixir-lang/vim-elixir') " ftplugin
    call minpac#add('pangloss/vim-javascript') " ftplugin
    call minpac#add('tsandall/vim-rego') " ftplugin
    call minpac#add('posva/vim-vue') " ftplugin
    call minpac#add('tpope/vim-scriptease') " ftplugin
    call minpac#add('saltstack/salt-vim') " ftplugin
    " }}}
    " Git {{{
    call minpac#add('tpope/vim-fugitive', { 'type': 'opt' })
    call minpac#add('idanarye/vim-merginal', { 'type': 'opt' })
    " }}}
    " Project navigation {{{
    call minpac#add('tpope/vim-projectionist') " Requires access to VimEnter
    " }}}
    " File manager {{{
    call minpac#add('justinmk/vim-dirvish') " Required for opening directories
    call minpac#add('tpope/vim-eunuch', {'type': 'opt'})
    " }}}
    " Completion {{{
    call minpac#add('prabirshrestha/async.vim') " autoload-only
    call minpac#add('prabirshrestha/vim-lsp')
    call minpac#add('Shougo/echodoc.vim', {'type': 'opt'})
    call minpac#add('fcpg/vim-complimentary') " autoload-only
    call minpac#add('hauleth/pivotaltracker.vim') " autoload-only
    " }}}
    " Code manipulation {{{
    call minpac#add('AndrewRadev/splitjoin.vim', {'type': 'opt'})
    call minpac#add('hauleth/sad.vim', {'type': 'opt'})
    call minpac#add('tommcdo/vim-exchange', {'type': 'opt'})
    call minpac#add('tommcdo/vim-lion', {'type': 'opt'})
    call minpac#add('tpope/vim-commentary', {'type': 'opt'})
    call minpac#add('tpope/vim-endwise') " Requires access to au FileType
    call minpac#add('tpope/vim-surround', {'type': 'opt'})
    " }}}
    " Movements {{{
    call minpac#add('wellle/targets.vim', {'type': 'opt'})
    call minpac#add('tommcdo/vim-ninja-feet')
    call minpac#add('rhysd/clever-f.vim')
    " }}}
    " Task running & quickfix {{{
    call minpac#add('hauleth/asyncdo.vim', {'type': 'opt'})
    call minpac#add('romainl/vim-qf', {'type': 'opt'})
    call minpac#add('romainl/vim-qlist', {'type': 'opt'})
    call minpac#add('Olical/vim-enmasse', {'type': 'opt'})
    call minpac#add('igemnace/vim-makery')
    " }}}
    " Splits management {{{
    call minpac#add('t9md/vim-choosewin', {'type': 'opt'})
    " }}}
    " Utils {{{
    call minpac#add('tpope/vim-repeat') " autoload-only plugin
    call minpac#add('tpope/vim-unimpaired', {'type': 'opt'})
    call minpac#add('tpope/vim-rsi', {'type': 'opt'})
    call minpac#add('machakann/vim-highlightedyank')
    if executable('direnv')
        call minpac#add('direnv/direnv.vim') " Requires access to VimEnter
    endif
    call minpac#add('sgur/vim-editorconfig') " Required during startup
    call minpac#add('tpope/vim-characterize')
    call minpac#add('junegunn/limelight.vim')
    call minpac#add('wakatime/vim-wakatime', {'type': 'opt'})
    call minpac#add('https://gitlab.com/hauleth/qfx.vim.git')
    call minpac#add('tpope/vim-dadbod')
    call minpac#add('https://gitlab.com/hauleth/smart.vim.git')
    " }}}
endfunc
