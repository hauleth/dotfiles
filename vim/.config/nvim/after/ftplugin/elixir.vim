setlocal iskeyword+=!,?

setlocal makeprg=mix

command! -buffer ModuleName echo ft#elixir#module_name()
command! -buffer Function echo ft#elixir#full_ident()
command! -buffer XrefCallers call asyncdo#run(1, { 'job': 'mix', 'errorformat': '%f:%l: %m' }, 'xref', 'callers', ft#elixir#full_ident())
command! -buffer -nargs=* -complete=customlist,ft#elixir#mix_compl -bang Mix call asyncdo#run(<bang>0, 'mix', <q-args>)

inoreabbrev <buffer> mdoc @moduledoc """<CR>"""<Up><End>
inoreabbrev <buffer> fdoc @doc """<CR>"""<Up><End>
inoreabbrev <buffer> pry require IEx; IEx.pry

inoreabbrev <buffer> defm defmodule
inoreabbrev <buffer> defi defimpl

inoremap <buffer> ,, <Space>=>

inoreabbrev <buffer> pkey add :id, :binary_id, primary_key: true

setlocal path=lib,apps/*/lib,apps/*/mix.exs,mix.exs,tests,apps/*/tests

nnoremap <buffer> gQ :%!mix format -<CR>

let b:undo_ftplugin = b:undo_ftplugin . ' | setl path& mp& isk&'
