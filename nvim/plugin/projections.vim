func! s:PhoenixFileTemplate(type, ...)
  let l:project = '{project|basename|camelcase}'

  return 'defmodule '.l:project.'.{camelcase}'.a:0." do\n"
        \.'  use '.l:project.'Web, :'.a:type."\n"
        \.'end'
endfunc

let g:projectionist_heuristics = {
      \ 'mix.exs&web/web.ex': {
      \    '*': {
      \      'start': 'mix phoenix.server',
      \      'make': 'mix',
      \      'console': 'iex -S mix',
      \    },
      \
      \    'test/*_test.exs': {
      \      'alternate': 'web/{}.ex',
      \      'dispatch': 'mix test {file}',
      \    },
      \
      \    'web/channels/*_channel.ex': {
      \      'type': 'channel',
      \      'alternate': 'test/channels/{}_channel_test.exs',
      \      'template': <SID>PhoenixFileTemplate('channel', 'Channel'),
      \    },
      \    'web/controllers/*_controller.ex': {
      \      'type': 'controller',
      \      'alternate': 'test/controllers/{}_controller_test.exs',
      \      'template': <SID>PhoenixFileTemplate('controller', 'Controller'),
      \    },
      \    'web/models/*.ex': {
      \      'type': 'model',
      \      'alternate': 'test/models/{}_test.exs',
      \      'template': <SID>PhoenixFileTemplate('model'),
      \    },
      \    'web/uploaders/*.ex': {
      \      'type': 'uploader',
      \    },
      \    'web/views/*_view.ex': {
      \      'type': 'view',
      \      'alternate': 'test/views/{}_view_test.exs',
      \      'template': <SID>PhoenixFileTemplate('view', 'View'),
      \    },
      \
      \    'web/router.ex': { 'type': 'router' },
      \  },
      \  'Cargo.toml': {
      \    'src/{}.rs': { 'type': 'source' }
      \  }
      \}
