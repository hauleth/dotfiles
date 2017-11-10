let s:projections = {
            \ 'src/*.rs': {
            \   'type': 'src',
            \ },
            \ 'tests/*.rs': {
            \   'type': 'test',
            \ },
            \ 'benchmarks/*.rs': {
            \   'type': 'bench',
            \ },
            \ 'Cargo.toml': { 'type': 'config' },
            \ }

func! projections#rust#detect() abort
    let l:root = projections#find_root(
                \ g:projectionist_file,
                \ {path -> filereadable(path . '/Cargo.toml')})
    call projections#append(l:root, s:projections)
endfunc
