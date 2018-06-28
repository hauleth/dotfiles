let s:projections = {
            \ 'apps/*/mix.exs': { 'type': 'app' },
            \ 'lib/*.ex': {
            \   'type': 'lib',
            \   'alternate': 'test/{}_test.exs',
            \   'template': ['defmodule {camelcase|capitalize|dot} do', 'end'],
            \ },
            \ 'test/*_test.exs': {
            \   'type': 'test',
            \   'alternate': 'lib/{}.ex',
            \   'template': ['defmodule {camelcase|capitalize|dot}Test do', '  use ExUnit.Case', 'end'],
            \ },
            \ 'priv/**/migrations/*.exs': { 'type': 'migration' },
            \ 'mix.exs': { 'type': 'mix' },
            \ 'config/*.exs': { 'type': 'config' },
            \ '*.ex': {
            \   'makery': {
            \     'lint': { 'compiler': 'credo' },
            \     'test': { 'compiler': 'exunit' },
            \     'build': { 'compiler': 'mix' }
            \   }
            \ },
            \ '*.exs': {
            \   'makery': {
            \     'lint': { 'compiler': 'credo' },
            \     'test': { 'compiler': 'exunit' },
            \     'build': { 'compiler': 'mix' }
            \   }
            \ }
            \ }

func! projections#elixir#detect() abort
    let l:root = projections#find_root(
                \ g:projectionist_file,
                \ {path -> filereadable(path . '/mix.exs')})
    call projections#append(l:root, s:projections)
endfunc
