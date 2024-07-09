--[[
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(function(_, result, ctx, config)
  local _, fwin = vim.lsp.handlers.signature_help(_, result, ctx, config)
  if fwin then
    vim.wo[fwin].signcolumn = 'no'
  end
end, { border = 'rounded' , max_height = 3, max_width = 120})

--]]

local luasnip = require('luasnip')

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "none",
	focus = false,
	height = 2,
	max_width = 200,
	max_heigth = 3,
  }
)

vim.keymap.set({'i', 'n', 'v'}, '<C-F>', function() luasnip.jump(1) end, {noremap=true, silent=true})
vim.keymap.set({'i', 'n', 'v'}, '<C-S-F>', function() luasnip.jump(-1) end, {noremap=true, silent=true})
vim.keymap.set({'i', 'n', 'v'}, '<C-s>', function() vim.lsp.buf.signature_help() end, {noremap=true, silent=true})

function close_floating()
  local inactive_floating_wins = vim.fn.filter(vim.api.nvim_list_wins(), function(k, v)
    local file_type = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(v), "filetype")

    return vim.api.nvim_win_get_config(v).relative ~= ""
      and v ~= vim.api.nvim_get_current_win()
      and file_type ~= "hydra_hint"
  end)
  for _, w in ipairs(inactive_floating_wins) do
    pcall(vim.api.nvim_win_close, w, false)
  end
end
