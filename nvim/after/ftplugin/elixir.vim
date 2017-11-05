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

augroup elixir_projectionist
    au!
    autocmd User ProjectionistDetect call projections#elixir#detect()
augroup END
