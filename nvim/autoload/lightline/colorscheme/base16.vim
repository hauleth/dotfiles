" =============================================================================
" Filename: autoload/lightline/colorscheme/base16.vim
" Version: 1.2
" Author: pythonproof
" License: MIT License
" Last Change: 2015-01-24 18:27:00
" =============================================================================
let s:background = [ '#2b303b', 0 ]
let s:red = [ '#bf616a', 1 ]
let s:green = [ '#a3be8c', 2 ]
let s:yellow = [ '#ebcb8b', 3]
let s:blue = [ '#8fa1b3', 4 ]
let s:magenta = [ '#a67db3', 5 ]
let s:lightgray = [ '#585858', 8 ]
let s:black = [ '#262626', 0]
let s:darkgray = [ '#3a3a3a', 18]
let s:gray = [ '#a8a8a8', 20]
let s:text = [ '#121212', 18]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:text, s:blue, 'bold' ], [ s:gray, s:darkgray ] ]
let s:p.normal.right = [ [ s:text, s:blue ], [ s:blue, s:darkgray ] ]
let s:p.normal.middle = [ [ s:lightgray , s:background ] ]
let s:p.insert.left = [ [ s:text, s:green, 'bold' ], [ s:gray, s:darkgray ] ]
let s:p.insert.right = [ [ s:text, s:green ], [ s:green, s:darkgray ] ]
let s:p.replace.left = [ [ s:text, s:red, 'bold' ], [ s:gray, s:darkgray ] ]
let s:p.replace.right = [ [ s:text, s:red ], [ s:red, s:darkgray ] ]
let s:p.visual.left = [ [ s:text, s:magenta, 'bold' ], [ s:gray, s:darkgray ] ]
let s:p.visual.right = [ [ s:text, s:magenta ], [ s:magenta, s:darkgray ] ]
let s:p.inactive.left =  [ [ s:gray , s:black ], [ s:lightgray , s:black ] ]
let s:p.inactive.right = [ [ s:lightgray , s:darkgray ], [ s:lightgray , s:black ] ]
let s:p.inactive.middle = [ [ s:lightgray , s:black ] ]
let s:p.tabline.left = [ [ s:magenta, s:background ] ]
let s:p.tabline.tabsel = copy(s:p.normal.right)
let s:p.tabline.middle = [ [ s:blue, s:black ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:darkgray ] ]
let s:p.normal.warning = [ [ s:magenta, s:darkgray ] ]

let g:lightline#colorscheme#base16#palette = lightline#colorscheme#flatten(s:p)
