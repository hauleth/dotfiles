" unlet b:current_syntax
" syntax include @toml syntax/toml.vim
" syntax region tomlFrontmatter start=/\%^---\+$/ end=/^---\+$/ keepend contains=@toml
