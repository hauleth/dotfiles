local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local server_name = 'erlangls'
configs[server_name] = {
  default_config = {
    filetypes = {'erlang'},
    root_dir = function(fname)
      return util.root_pattern('rebar.config', '.git')(fname) or vim.loop.os_homedir()
    end
  }
}
