require("base")
--vim.g.loaded_netrwPlugin = 1
-- set clipboard= using luascript
--vim.cmd("set clipboard=")
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
-- vim.cmd("packadd termdebug")

-- Define a function to execute grep and return the result
local function Grep(...)
  local args = table.concat({...}, ' ')
  return vim.fn.system(vim.o.grepprg .. ' ' .. vim.fn.expandcmd(args))
end

-- Create a command for `Grep` to populate the quickfix list
vim.api.nvim_create_user_command('Grep', function(opts)
  vim.fn.setqflist({}, 'r', {lines = vim.split(Grep(unpack(opts.fargs)), '\n')})
  vim.cmd("copen")
end, {nargs = '+', complete = 'file_in_path'})

-- Create a command for `LGrep` to populate the location list
vim.api.nvim_create_user_command('LGrep', function(opts)
  vim.fn.setloclist(0, {}, 'r', {lines = vim.split(Grep(unpack(opts.fargs)), '\n')})
  vim.cmd("lopen")
end, {nargs = '+', complete = 'file_in_path'})

-- Abbreviate `grep` and `lgrep` to their corresponding commands
vim.cmd([[
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'
]])

-- Auto open quickfix or location list window after grep commands
vim.api.nvim_create_augroup('quickfix', { clear = true })

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  group = 'quickfix',
  pattern = 'cgetexpr',
  command = 'cwindow'
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  group = 'quickfix',
  pattern = 'lgetexpr',
  command = 'lwindow'
})

