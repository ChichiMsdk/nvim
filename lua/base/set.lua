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

--prevent netrw to use ctrl l
function netrw_mapping()
  vim.api.nvim_buf_set_keymap(0, 'n', '<c-l>', ':wincmd l<CR>', { noremap = true, silent = true })
end

vim.cmd( [[
augroup netrw_mapping
  autocmd!
  autocmd FileType netrw lua netrw_mapping()
augroup END
]])


--vim.cmd [[
--augroup remember_folds
--  autocmd!
--  autocmd BufWinLeave * mkview
--  autocmd BufWinEnter * silent! loadview
--augroup END
--]]
