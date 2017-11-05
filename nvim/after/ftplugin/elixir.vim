setlocal makeprg=mix
setlocal tabstop=2

iabbrev <buffer> mdoc @moduledoc """
iabbrev <buffer> pry require IEx; IEx.pry

iabbrev <buffer> defm defmodule
iabbrev <buffer> defi defimpl

inoremap <buffer> ,, <Space>=>

iabbrev <buffer> pkey add :id, :binary_id, primary_key: true

ClearSwapList

SwapList defs def defp
SwapList deps require import use alias
SwapList errors :ok :error

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
            \ }

augroup elixir_projectionist
    au!
    autocmd User ProjectionistDetect
                \ call projections#append(
                \   projections#find_root(g:projectionist_file, {path -> filereadable(path . '/mix.exs')}),
                \   s:projections)
augroup END
