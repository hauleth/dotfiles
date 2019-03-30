let g:projectionist_heuristics = {}

let g:projectionist_heuristics['Cargo.toml'] = {
            \ 'src/*.rs': {
            \   'type': 'src',
            \ },
            \ 'tests/*.rs': {
            \   'type': 'test',
            \ },
            \ 'benchmarks/*.rs': {
            \   'type': 'bench',
            \ },
            \ 'Cargo.toml': { 'type': 'config' },
            \ }

let g:projectionist_heuristics['mix.exs'] = {
            \ 'apps/*/mix.exs': { 'type': 'app' },
            \ 'lib/*.ex': {
            \   'type': 'lib',
            \   'alternate': 'test/{}_test.exs',
            \   'template': ['defmodule {camelcase|capitalize|dot} do', 'end'],
            \ },
            \ 'test/*_test.exs': {
            \   'type': 'test',
            \   'alternate': 'lib/{}.ex',
            \   'template': ['defmodule {camelcase|capitalize|dot}Test do', '  use ExUnit.Case', '', '  alias {camelcase|capitalize|dot}, as: Subject', '', '  doctest Subject', 'end'],
            \ },
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

let g:projectionist_heuristics['rebar.config'] = {
            \ '*.erl': {
            \   'template': ['-module({basename}).', '', '-export([]).', ''],
            \ },
            \ 'src/*.app.src': { 'type': 'app' },
            \ 'src/*.erl': {
            \   'type': 'src',
            \   'alternate': 'test/{}_SUITE.erl',
            \ },
            \ 'test/*_SUITE.erl': {
            \   'type': 'test',
            \   'alternate': 'src/{}.erl',
            \ },
            \ 'rebar.config': { 'type': 'rebar' }
            \ }

let g:projectionist_heuristics['package.json'] = {
            \ '*.js': { 'make': 'yarn' },
            \ 'package.json': { 'type': 'package' }
            \ }

let g:projectionist_heuristics['nuxt.config.js'] = {
            \ '*.vue': {
            \   'make': 'yarn',
            \   'template': [
            \     '<template>',
            \     '</template>',
            \     '',
            \     '<script>',
            \     'export default {open}',
            \     '{close}',
            \     '</script>',
            \     '',
            \     '<style>',
            \     '</style>',
            \   ]
            \ },
            \ 'components/*.vue': { 'type': 'component' },
            \ 'layouts/*.vue': { 'type': 'layout' },
            \ 'pages/*.vue': { 'type': 'page' },
            \ 'plugins/*.js': { 'type': 'plugin' },
            \ 'middlewares/*.js': { 'type': 'middleware' },
            \ 'store/*.js': {
            \   'type': 'store',
            \   'template': [
            \     'export const state = () => ({open}',
            \     '{close})',
            \     '',
            \     'export const getters = {open}',
            \     '{close}',
            \     '',
            \     'export const mutations = {open}',
            \     '{close}',
            \     '',
            \     'export const actions = {open}',
            \     '{close}',
            \   ]
            \ },
            \ 'nuxt.config.js': { 'type': 'config' },
            \ }

func! s:options() abort
    if &ft !=# '' | return | endif

    for [_, value] in projectionist#query('filetype')
        exec 'setf '.l:value
        return
    endfor
endfunc

augroup projectionist_ft
    au!
    au BufEnter * call <sid>options()
augroup END
