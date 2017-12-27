setlocal makeprg=mix
setlocal tabstop=2
setlocal iskeyword+=!,?

let &l:define = 'def\(macro\)\?p\?'

command! -buffer ModuleName echo ft#elixir#module_name()
command! -buffer Function echo ft#elixir#full_ident()
command! -buffer XrefCallers call asyncdo#run(1, 'mix', 'xref', 'callers', ft#elixir#full_ident())

inoreabbrev <buffer> mdoc @moduledoc """
inoreabbrev <buffer> pry require IEx; IEx.pry

inoreabbrev <buffer> defm defmodule
inoreabbrev <buffer> defi defimpl

inoremap <buffer> ,, <Space>=>

inoreabbrev <buffer> pkey add :id, :binary_id, primary_key: true

augroup elixir_projectionist
    au!
    autocmd User ProjectionistDetect call projections#elixir#detect()
augroup END
