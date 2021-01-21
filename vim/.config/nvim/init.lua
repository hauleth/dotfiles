-- Fennel loader, default one do not work well with NeoVim so there is custom
-- one
local fennel = require('fennel')
local function fennel_loader(name)
  local basename = name:gsub('%.', '/')
  local paths = {"fnl/"..basename..".fnl", "fnl/"..basename.."/init.fnl"}

  for _, path in ipairs(paths) do
    local found = vim.api.nvim_get_runtime_file(path, false)
    if #found > 0 then
      return function() return fennel.dofile(found[1]) end
    end
  end

  return nil
end
table.insert(package.loaders, 1, fennel_loader)

local u = require('utils')

require('startup')

-- Load legacy configuration file
vim.api.nvim_command('runtime! legacy.vim')
