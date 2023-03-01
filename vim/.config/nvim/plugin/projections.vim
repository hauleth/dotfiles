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
            \ 'src/*.erl': {
            \   'type': 'src',
            \   'alternate': 'test/{}_SUITE.erl',
            \ },
            \ 'test/*_test.exs': {
            \   'type': 'test',
            \   'alternate': 'lib/{}.ex',
            \   'template': ['defmodule {camelcase|capitalize|dot}Test do', '  use ExUnit.Case', '', '  @subject {camelcase|capitalize|dot}', '', '  doctest @subject', 'end'],
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
            \   'template': ['-module({basename}_SUITE).', '',
            \                '-compile(export_all).', '',
            \                '-include_lib("stdlib/include/assert.hrl").',
            \                '-include_lib("common_test/include/ct.hrl").', '',
            \                'all() -> [].'],
            \ },
            \ 'rebar.config': { 'type': 'rebar' }
            \ }

let g:projectionist_heuristics['package.json'] = {
            \ '*.js': { 'make': 'yarn' },
            \ 'package.json': { 'type': 'package' }
            \ }
