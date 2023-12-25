local o = vim.opt
o.guicursor= ""
o.termguicolors = true
o.nu= true
o.relativenumber= true
o.tabstop= 4
o.shiftwidth= 4
o.wrap= false
o.hlsearch=true
o.incsearch=true
o.scrolloff= 8
o.updatetime = 50
o.colorcolumn = "80"
o.hidden = true
vim.g.mapleader=" "
vim.g.NERDTreeWinPos = "right"
vim.cmd[[autocmd  InsertLeave * :set relativenumber]]
vim.cmd[[autocmd  InsertEnter * :set norelativenumber]]
vim.cmd[[autocmd  InsertEnter * :set nohlsearch]]
vim.cmd[[set cursorline]]
vim.cmd[[set undofile]]
vim.cmd[[set undolevels=10000]]
vim.cmd[[set undodir=/mnt/a/nvim/undodir]]
vim.cmd('command! QA :mksession! ./session.vim | qa')


--vim.api.nvim_create_autocmd("BufLeave", {
--    pattern = '*',
--    callback = save_win_view
--})

--vim.api.nvim_create_autocmd("BufEnter", {
--    pattern = '*',
--    callback = restore_win_view
--})

--vim.cmd [[
--augroup remember_folds
--  autocmd!
--  autocmd BufWinLeave * mkview
--  autocmd BufWinEnter * silent! loadview
--augroup END
--]]
