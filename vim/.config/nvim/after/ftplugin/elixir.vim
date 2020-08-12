setlocal iskeyword+=!,?

setlocal makeprg=mix

inoreabbrev <buffer> mdoc @moduledoc """<CR>"""<Up><End>
inoreabbrev <buffer> fdoc @doc """<CR>"""<Up><End>
inoreabbrev <buffer> pry require IEx; IEx.pry

inoreabbrev <buffer> defm defmodule
inoreabbrev <buffer> defi defimpl

inoremap <buffer> ,, <Space>=>

inoreabbrev <buffer> pkey add :id, :binary_id, primary_key: true

setlocal path=lib,apps/*/lib,apps/*/mix.exs,mix.exs,tests,apps/*/tests

let b:undo_ftplugin = b:undo_ftplugin . ' | setl path& mp& isk&'
