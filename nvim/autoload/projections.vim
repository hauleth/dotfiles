func! projections#find_root(path, func) abort
    let root = simplify(fnamemodify(a:path, ':p'))
    let previous = ''
    while root !=# previous && root !=# '/'
        if a:func(root)
            return root
        end
        let previous = root
        let root = fnamemodify(root, ':h')
    endwhile
    return ''
endfunc

func! projections#append(path, projections) abort
    if a:path !=# ''
        call projectionist#append(a:path, a:projections)
    endif
endfunc
