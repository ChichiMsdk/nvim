vim.g.myvimrc = vim.fn.expand('<sfile>:p:h')

local set_path = vim.g.myvimrc .. "/lua/set.vim"
local better_tags_path = vim.g.myvimrc .. "/lua/better_tags.vim"

vim.cmd('source ' .. set_path)
require("base")
vim.cmd('source ' .. better_tags_path)

vim.api.nvim_exec('language en_US', true)
