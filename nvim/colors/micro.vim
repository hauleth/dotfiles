" Name: No Frils Dark Colorscheme (cgt)
" Author: robertmeta (on Github), cgt
" URL: https://github.com/cgt/nofrils
" License: OSI approved MIT license

set background=dark

hi! clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "micro"

" Baseline
hi! Normal       term=NONE   cterm=NONE  ctermfg=255     ctermbg=234     gui=NONE    guifg=#eeeeee   guibg=#1c1c1c

" Faded
hi! ColorColumn  term=NONE   cterm=NONE  ctermfg=NONE    ctermbg=236     gui=NONE    guifg=NONE      guibg=#303030
hi! FoldColumn   term=NONE   cterm=NONE  ctermfg=0       ctermbg=240     gui=NONE    guifg=#000000   guibg=#585858
hi! LineNr       term=NONE   cterm=NONE  ctermfg=240     ctermbg=NONE    gui=NONE    guifg=#585858   guibg=NONE
hi! StatusLineNC term=NONE   cterm=NONE  ctermfg=white   ctermbg=240     gui=NONE    guifg=#FFFFFF   guibg=#585858
hi! VertSplit    term=NONE   cterm=NONE  ctermfg=black   ctermbg=240     gui=NONE    guifg=#000000   guibg=#585858

hi! Comment      term=NONE   cterm=NONE  ctermfg=246     ctermbg=NONE    gui=NONE    guifg=#949494   guibg=NONE
hi! link Character  Comment
hi! link Folded     Comment
hi! link NonText    Comment
hi! link SignColumn Comment
hi! link SpecialKey Comment
hi! link String     Comment

hi! link Ignore Comment

" Highlighted
hi! CursorIM     term=NONE   cterm=NONE  ctermfg=0       ctermbg=4       gui=NONE    guifg=#000000   guibg=#00FFFF
hi! CursorLineNr term=NONE   cterm=NONE  ctermfg=NONE    ctermbg=0       gui=NONE    guifg=NONE      guibg=#000000
hi! CursorLine   term=NONE   cterm=NONE  ctermfg=NONE    ctermbg=0       gui=NONE    guifg=NONE      guibg=#000000
hi! CursorColumn term=NONE   cterm=NONE  ctermfg=NONE    ctermbg=0       gui=NONE    guifg=NONE      guibg=#000000
hi! Cursor       term=NONE   cterm=NONE  ctermfg=0       ctermbg=4       gui=NONE    guifg=#000000   guibg=#00FFFF
hi! Directory    term=NONE   cterm=NONE  ctermfg=69      ctermbg=NONE    gui=NONE    guifg=#5F87FF   guibg=NONE
hi! ErrorMsg     term=NONE   cterm=NONE  ctermfg=15      ctermbg=52      gui=NONE    guifg=NONE      guibg=#5F0000
hi! Error        term=NONE   cterm=NONE  ctermfg=15      ctermbg=52      gui=NONE    guifg=NONE      guibg=#5F0000
hi! ModeMsg      term=NONE   cterm=NONE  ctermfg=69      ctermbg=NONE    gui=NONE    guifg=#5F87FF   guibg=NONE
hi! MoreMsg      term=NONE   cterm=NONE  ctermfg=69      ctermbg=NONE    gui=NONE    guifg=#5F87FF   guibg=NONE
hi! Question     term=NONE   cterm=NONE  ctermfg=69      ctermbg=NONE    gui=NONE    guifg=#5F87FF   guibg=NONE
hi! Search       term=NONE   cterm=NONE  ctermfg=0       ctermbg=6       gui=NONE    guifg=#000000   guibg=#00CDCD
hi! StatusLine   term=NONE   cterm=NONE  ctermfg=0       ctermbg=15      gui=NONE    guifg=#000000   guibg=#FFFFFF
hi! Todo         term=NONE   cterm=NONE  ctermfg=10      ctermbg=NONE    gui=NONE    guifg=#00FF00   guibg=#000000
hi! VisualNOS    term=NONE   cterm=NONE  ctermfg=NONE    ctermbg=69      gui=NONE    guifg=NONE      guibg=#5F87FF
hi! WarningMsg   term=NONE   cterm=NONE  ctermfg=15      ctermbg=52      gui=NONE    guifg=NONE      guibg=#5F0000

" Reversed
hi! DiffText     term=reverse    cterm=reverse   ctermfg=NONE    ctermbg=NONE    gui=reverse guifg=NONE  guibg=NONE
hi! link IncSearch DiffText
hi! link MatchParen DiffText
hi! link Pmenu DiffText
hi! link TabLineSel DiffText
hi! link Visual DiffText
hi! link WildMenu DiffText

" Diff
hi! DiffAdd      term=NONE       cterm=NONE      ctermfg=15      ctermbg=22      gui=NONE        guifg=NONE      guibg=#005F00
hi! DiffChange   term=NONE       cterm=NONE      ctermfg=15      ctermbg=17      gui=NONE        guifg=NONE      guibg=#00005F
hi! DiffDelete   term=NONE       cterm=NONE      ctermfg=15      ctermbg=52      gui=NONE        guifg=NONE      guibg=#5F0000
hi! DiffText     term=reverse    cterm=reverse   ctermfg=NONE    ctermbg=NONE    gui=reverse     guifg=NONE      guibg=NONE

" Spell
hi! SpellBad     term=underline  cterm=underline ctermfg=13      ctermbg=NONE    gui=underline   guifg=#FF00FF   guibg=NONE
hi! link SpellCap SpellBad
hi! link SpellLocal SpellBad
hi! link SpellRare SpellBad

" Vim Features
hi! Menu         term=NONE       cterm=NONE      ctermfg=NONE    ctermbg=NONE    gui=NONE        guifg=NONE      guibg=NONE
hi! link PmenuSbar Menu
hi! link PmenuSel Menu
hi! link PmenuThumb Menu
hi! link Scrollbar Menu
hi! link TabLine Menu
hi! link TabLineFill Menu
hi! link Tooltip Menu

" Syntax Highlighting (or lack of)
hi! Boolean      term=NONE       cterm=NONE      ctermfg=NONE    ctermbg=NONE    gui=NONE        guifg=NONE      guibg=NONE
hi! link Conceal Boolean
hi! link Conditional Boolean
hi! link Constant Boolean
hi! link Debug Boolean
hi! link Delimiter Boolean
hi! link Directive Boolean
hi! link Exception Boolean
hi! link Float Boolean
hi! link Format Boolean
hi! link Function Boolean
hi! link Identifier Boolean
hi! link Label Boolean
hi! link Macro Boolean
hi! link Number Boolean
hi! link Operator Boolean
hi! link PreCondit Boolean
hi! link PreProc Boolean
hi! link Repeat Boolean
hi! link Special Boolean
hi! link SpecialChar Boolean
hi! link SpecialComment Boolean
hi! link StorageClass Boolean
hi! link Structure Boolean
hi! link Tag Boolean
hi! link Title Boolean
hi! link Typedef Boolean
hi! link Type Boolean

hi! Keyword      term=bold       cterm=bold      ctermfg=NONE    ctermbg=NONE    gui=bold        guifg=NONE      guibg=NONE
hi! link Define Keyword
hi! link Statement Keyword
hi! link Include Keyword

hi! Underlined      term=underline       cterm=NONE      ctermfg=NONE    ctermbg=NONE    gui=NONE        guifg=NONE      guibg=NONE

" Git
hi! gitcommitSummary ctermbg=NONE ctermfg=67 cterm=NONE guibg=NONE guifg=#5f87af gui=NONE

" Sneak
hi! link Sneak DiffText
