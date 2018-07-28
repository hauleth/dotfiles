if exists('g:loaded_utils')
    finish
endif
let g:loaded_utils = 1

func! s:psql_complete(lead, ...) abort
    let l:dbs = systemlist("psql -Atqwl | awk -F '|' 'NF > 1 { print $1 }'")

    return filter(l:dbs, {_, val -> val =~? '^'.a:lead})
endfunc

command! -nargs=+ -complete=customlist,s:psql_complete Psql split term://pgcli <args>
