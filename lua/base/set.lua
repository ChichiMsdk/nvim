local o = vim.opt
o.guicursor= ""
o.termguicolors = true
o.nu= true
o.relativenumber= true
o.tabstop= 4
o.shiftwidth= 4
o.wrap= false
o.hlsearch=rue
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
