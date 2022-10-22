-- Fennel loader, default one do not work well with NeoVim so there is custom
-- one
_G.fennel = require('fennel')

-- Load Fennel modules
local function fennel_loader(name)
  local basename = name:gsub('%.', '/')
  local paths = {"fnl/"..basename..".fnl", "fnl/"..basename.."/init.fnl"}

  for _, path in ipairs(paths) do
    local found = vim.api.nvim_get_runtime_file(path, false)
    if #found > 0 then
      return function() return fennel.dofile(found[1], {compilerEnv = _G}) end, found[1]
    end
  end

  return nil
end
table.insert(package.loaders, 1, fennel_loader)

-- Load Fennel macros
local function fennel_paths(suffixes)
  local paths = ""
  for _, dir in pairs(vim.api.nvim_get_runtime_file("fnl/", true)) do
    for _, suffix in pairs(suffixes) do
      paths = paths .. ";" .. dir .. "?" .. suffix .. ".fnl"
    end
  end

  return paths
end
fennel["path"] = fennel["path"] .. fennel_paths({"", "/init"})
fennel["macro-path"] = fennel["macro-path"] .. fennel_paths({"", "/macro-init", "/init"})

debug.traceback = fennel.traceback

-- Command-mode Fennel execution
vim.api.nvim_create_user_command('Fennel', function(arg) fennel.eval(arg.args) end, {nargs = '*'})

for _, init in pairs(vim.api.nvim_get_runtime_file("init.fnl", false)) do
  fennel.dofile(init, {compilerEnv = _G})
end
