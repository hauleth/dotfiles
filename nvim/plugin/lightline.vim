let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'filename' ],
      \     [ 'bufferline' ],
      \   ],
      \   'right': [
      \     [ 'syntastic', 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ]
      \   ]
      \ },
      \ 'enable': {
      \   'statusline': 1,
      \   'tabline': 1,
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'bufferline': 'LightLineBufferline',
      \   'mode': 'LightLineMode',
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|undotree' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|undotree' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname =~ 'undotree' ? '' :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'undotree' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineBufferline()
  if &ft !~? 'undotree'
    call bufferline#refresh_status()
    let b = g:bufferline_status_info.before
    let c = g:bufferline_status_info.current
    let a = g:bufferline_status_info.after
    let alen = strlen(a)
    let blen = strlen(b)
    let clen = strlen(c)
    let w = winwidth(0) * 4 / 11
    if w < alen+blen+clen
      let whalf = (w - strlen(c)) / 2
      let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
      let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
      return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
    else
      return b . c . a
    endif
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost * call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction
