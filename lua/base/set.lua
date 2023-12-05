local vim = vim
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
vim.cmd[[set undodir=/Users/chichi/.config/nvim/undodir]]
vim.cmd('command! QA :mksession! ./session.vim | qa')

local saved_views = {}

local function save_win_view()
    local current_buf = vim.api.nvim_get_current_buf()
    saved_views[current_buf] = vim.fn.winsaveview()
end

local function restore_win_view()
    local current_buf = vim.api.nvim_get_current_buf()
    if saved_views[current_buf] then
        vim.fn.winrestview(saved_views[current_buf])
    end
end

vim.api.nvim_create_autocmd("BufLeave", {
    pattern = '*',
    callback = save_win_view
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = '*',
    callback = restore_win_view
})

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
