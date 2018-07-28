setlocal spell

let g:issue_tracker = 'pivotaltracker'

if pivotaltracker#available() || get(g:, 'issue_tracker') is# 'pivotaltracker'
    setlocal omnifunc=pivotaltracker#stories
endif
