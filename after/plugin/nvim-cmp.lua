local luasnip = require('luasnip')

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single",
	height = 1,
	focus = false,
  }
)
vim.keymap.set({'i', 'n', 'v'}, '<C-F>', function() luasnip.jump(1) end, {noremap=true, silent=true})
vim.keymap.set({'i', 'n', 'v'}, '<C-S-F>', function() luasnip.jump(-1) end, {noremap=true, silent=true})
vim.keymap.set({'i', 'n', 'v'}, '<C-s>', vim.lsp.buf.signature_help, {noremap=true, silent=true})

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
