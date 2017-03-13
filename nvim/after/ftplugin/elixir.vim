setlocal makeprg=mix
setlocal ts=2

iabbrev <buffer> mdoc @moduledoc """
iabbrev <buffer> pry require IEx; IEx.pry

iabbrev <buffer> defm defmodule
iabbrev <buffer> defi defimpl

inoremap ,, <Space>=>

ClearSwapList

SwapList defs def defp
SwapList deps require import use alias
SwapList errors :ok :error
