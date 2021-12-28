require('impatient').enable_profile()

-- Fennel loader, default one do not work well with NeoVim so there is custom
-- one
_G.fennel = require('fennel')
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

local fennel_paths = ""
for _, v in pairs(vim.api.nvim_get_runtime_file("fnl/", false)) do
  fennel_paths = fennel_paths .. ";" .. v .. "?.fnl"
  fennel_paths = fennel_paths .. ";" .. v .. "?/init.fnl"
end
fennel.path = fennel.path .. fennel_paths

require('startup')
