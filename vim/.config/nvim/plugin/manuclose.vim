if exists('g:loaded_manuclose')
    finish
endif
let g:loaded_manuclose = 1

fun! s:manual_close()
    let cls = {}
    let opn = {}

    for [l:o, l:c] in map(split(&matchpairs, ','), 'split(v:val, ":")')
        let cls[l:o] = l:c
        let opn[l:c] = l:o
    endfor
    let stack = []

    for c in split(getline('.'), '\zs')
        if match(join(keys(l:cls)) , c) > -1
            call insert(stack, c)
        elseif match(join(keys(l:opn)), c) > -1
            call remove(stack, index(stack, opn[c]))
        endif
    endfor

    return len(stack) ? cls[stack[0]] : ''
endfun

inoremap <expr> <C-]> <SID>manual_close()
