if exists('g:loaded_pastebin')
    finish
endif
let g:loaded_pastebin = 1

function s:pastebin(line1, line2) abort
  let l:filename = expand("%:p:t")
  let l:lines = getline(a:line1, a:line2)
  let l:url = trim(system("curl --netrc-optional -F 'f:1=@-;filename=\"".l:filename."\"' ix.io", l:lines))

  let @+ = l:url

  echom "URL: ".l:url
endfunction

command! -range=% IX call <SID>pastebin(<line1>, <line2>)
