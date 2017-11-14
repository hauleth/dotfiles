setlocal makeprg=mix
setlocal tabstop=2

command! -buffer ModuleName echo ft#elixir#module_name()
command! -buffer Function echo ft#elixir#full_ident()
command! -buffer XrefCallers call asyncdo#run(1, 'mix', 'xref', 'callers', ft#elixir#full_ident())

inoreabbrev <buffer> mdoc @moduledoc """
inoreabbrev <buffer> pry require IEx; IEx.pry

inoreabbrev <buffer> defm defmodule
inoreabbrev <buffer> defi defimpl

inoremap <buffer> ,, <Space>=>

inoreabbrev <buffer> pkey add :id, :binary_id, primary_key: true

ClearSwapList

SwapList defs def defp
SwapList deps require import use alias
SwapList errors :ok :error

augroup elixir_projectionist
    au!
    autocmd User ProjectionistDetect call projections#elixir#detect()
augroup END
