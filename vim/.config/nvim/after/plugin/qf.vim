function! s:MarkQF() abort
  if !qf#IsQfWindowOpen()
    let g:quickfix_pending = 1
  endif
endfunction

function! s:UnmarkQF() abort
  if exists('g:quickfix_pending')
    unlet g:quickfix_pending
  endif
endfunction

augroup QfAfter
  autocmd!

  autocmd QuickFixCmdPost [^l]* call s:MarkQF()
  autocmd Filetype qf call s:UnmarkQF()
augroup END
