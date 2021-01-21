local function tbl_filter(func, t)
  vim.validate{func={func,'c'},t={t,'t'}}

  local rettab = {}
  for key, entry in pairs(t) do
    if func(key, entry) then
      rettab[key] = entry
    end
  end
  return rettab
end

local function normalise_map(rhs, opts)
  -- If it is command line map, then automaticall add <C-u> for cleaning
  -- selection and <CR> at the end, to fire it up
  if vim.startswith(rhs, ':') and rhs ~= ':' then
    if not vim.startswith(rhs, ':<C-u>') and options["selection"] then
      rhs = '<cmd>' .. rhs:sub(2)
    end
    if not vim.endswith(rhs, '<CR>') and options["cr"] then
      rhs = rhs .. '<CR>'
    end
  end

  return rhs
end

local function do_map(cb)
  return function(modes, lhs, rhs, opts)
    -- Defaults to non recursive mappings
    options = vim.tbl_extend('force', {noremap = true, selection = true, cr = true}, opts or {})

    if modes == '' then
      error('Modes must not be empty')
    end

    local f = function(k, _)
      return not (k == "selection" or k == "cr")
    end
    local map_opts = tbl_filter(f, options)
    local normalised = normalise_map(rhs, options)

    for mode in modes:gmatch('.') do
      cb(mode, lhs, normalised, map_opts)
    end
  end
end

return {
  map = do_map(vim.api.nvim_set_keymap),
  buf_map = do_map(function(...) vim.api.nvim_buf_set_keymap(0, ...) end)
}
