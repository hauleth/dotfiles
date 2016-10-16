let g:projectionist_heuristics = {
      \ "mix.exs&web/web.ex": {
      \    "*": {
      \      "start": "mix phoenix.server",
      \      "make": "mix",
      \    },
      \
      \    "test/*_test.exs": {
      \      "alternate": "web/{}.ex",
      \      "dispatch": "mix test {file}",
      \    },
      \
      \    "web/channels/*_channel.ex": {
      \      "type": "channel",
      \      "alternate": "test/channels/{}_channel_test.exs",
      \      "template": "defmodule {project|basename|camelcase}.{camelcase}Channel do\n  use {project|basename|camelcase}.Web, :channel\nend"
      \    },
      \    "web/controllers/*_controller.ex": {
      \      "type": "controller",
      \      "alternate": "test/controllers/{}_controller_test.exs",
      \      "template": "defmodule {project|basename|camelcase}.{camelcase}Controller do\n  use {project|basename|camelcase}.Web, :controller\nend"
      \    },
      \    "web/models/*.ex": {
      \      "type": "model",
      \      "alternate": "test/models/{}_test.exs",
      \      "template": "defmodule {project|basename|camelcase}.{camelcase} do\n  use {project|basename|camelcase}.Web, :model\nend"
      \    },
      \    "web/uploaders/*.ex": {
      \      "type": "uploader",
      \    },
      \    "web/views/*_view.ex": {
      \      "type": "view",
      \      "alternate": "test/views/{}_view_test.exs",
      \      "template": "defmodule {project|basename|camelcase}.{camelcase}View do\n  use {project|basename|camelcase}.Web, :view\nend"
      \    },
      \
      \    "web/router.ex": { "type": "router" },
      \  },
      \  "Cargo.toml": {
      \    "src/{}.rs": { "type": "source" }
      \  }
      \}
