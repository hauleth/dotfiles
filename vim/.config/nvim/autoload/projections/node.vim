let s:yarn_projections = {
            \ '*.js': { 'make': 'yarn' },
            \ 'package.json': { 'type': 'package' }
            \ }
let s:nuxt_projections = {
            \ '*.vue': {
            \   'make': 'yarn',
            \   'template': [
            \     '<template>',
            \     '</template>',
            \     '',
            \     '<script>',
            \     'export default {open}',
            \     '{close}',
            \     '</script>',
            \     '',
            \     '<style>',
            \     '</style>',
            \   ]
            \ },
            \ 'components/*.vue': { 'type': 'component' },
            \ 'layouts/*.vue': { 'type': 'layout' },
            \ 'pages/*.vue': { 'type': 'page' },
            \ 'plugins/*.js': { 'type': 'plugin' },
            \ 'middlewares/*.js': { 'type': 'middleware' },
            \ 'store/*.js': {
            \   'type': 'store',
            \   'template': [
            \     'export const state = () => ({open}',
            \     '{close})',
            \     '',
            \     'export const getters = {open}',
            \     '{close}',
            \     '',
            \     'export const mutations = {open}',
            \     '{close}',
            \     '',
            \     'export const actions = {open}',
            \     '{close}',
            \   ]
            \ },
            \ 'nuxt.config.js': { 'type': 'config' },
            \ }

func! s:check_for(file, projections) abort
    let l:root = projections#find_root(
                \ g:projectionist_file,
                \ {path -> filereadable(path . a:file)})
    call projections#append(l:root, a:projections)
endfunc

func! projections#node#detect() abort
    call s:check_for('/nuxt.config.js', s:nuxt_projections)
    call s:check_for('/package.json', s:yarn_projections)
endfunc
