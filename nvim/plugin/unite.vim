call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_length'])

let g:unite_split_rule = 'botright'
let g:unite_prompt = '» '
let g:unite_force_overwrite_statusline = 0

" FuzzySearch
nnoremap <silent> <C-p> :<C-u>Unite -start-insert -buffer-name=Files file_rec/async:! file/new<CR>

" Outline
nnoremap <silent> <C-o> :<C-u>Unite -buffer-name=Outline -immediately -auto-highlight -vertical outline<CR>

" Project search
nnoremap <silent> <leader>/ :Search<CR>
command! Search Unite -auto-preview -no-split -immediately -buffer-name=Search grep:.


" Use ag for search
if executable('ag')
  let g:unite_source_rec_async_command =
      \ ['ag', '--nocolor', '--nogroup', '--hidden', '-g', '']

  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --vimgrep --hidden --ignore .git'
  let g:unite_source_grep_recursive_opt = ''
endif
