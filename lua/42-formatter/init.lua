local M = {}
local api = vim.api

M.opts = {
  formatter = 'c_formatter_42',
  filetypes = { c = true, h = true, cpp = true, hpp = true },
}

function M.set_equalprg(formatter)
  local current_buf = api.nvim_get_current_buf()
  api.nvim_buf_set_option(current_buf, 'equalprg', formatter)
end

M.format = function(filetypes, formatter)
  if filetypes[vim.bo.filetype] then
    M.set_equalprg(formatter)
    api.nvim_feedkeys('gg=G', 'n', true)
  else
    vim.notify("Unsupported file type", vim.log.levels.WARN)
  end
end

M.setup = function(opts)
  M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})

  api.nvim_create_user_command('CFormat42', function()
    M.format(M.opts.filetypes, M.opts.formatter)
  end, {})
end

return M
