vim.g.mapleader=" "

-- Function to dynamically set color column
local function set_color_column()
  local colorcolumn_enabled = false
  for i = 1, vim.api.nvim_buf_line_count(0) do
    if #vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1] > 120 then
      colorcolumn_enabled = true
      break
    end
  end

  if colorcolumn_enabled then
    vim.wo.colorcolumn = "120"
  else
    vim.wo.colorcolumn = ""
  end
end

-- Autocommand group to update color column
vim.api.nvim_create_augroup("ColorColumn", { clear = true })
vim.api.nvim_create_autocmd(
{"BufWinEnter", "BufReadPost", "InsertLeave", "TextChanged", "TextChangedI"},
{
  group = "ColorColumn",
  pattern = "*",
  callback = set_color_column
}
)
