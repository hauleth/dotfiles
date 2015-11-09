call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom_source('buffer,file_rec/neovim,file_rec/async',
      \ 'sorters', 'sorter_selecta')

let g:unite_split_rule = "botright"

let g:unite_prompt = '» '

call unite#custom_source('file_rec/neovim,file_rec/async,file_mru,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'vendor/',
      \ 'tmp/',
      \ 'public/',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'target/',
      \ ], '\|'))

let g:unite_source_rec_async_command =
      \ ['ag', '--follow', '--nocolor', '--nogroup',
      \  '--hidden', '-g', '']

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
