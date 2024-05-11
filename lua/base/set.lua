local o = vim.opt
o.termguicolors = true
o.nu= false
o.relativenumber= false
o.tabstop= 4
o.shiftwidth= 4
o.wrap= false
o.hlsearch=false
o.incsearch=true
o.scrolloff= 8
o.updatetime = 500
o.colorcolumn = "80"
o.hidden = true
vim.g.mapleader=" "
vim.g.NERDTreeWinPos = "right"
vim.g.numbers=false
-- vim.api.nvim_buf_set_var(0, 'vim.g.numbers', false)

-- vim.cmd[[autocmd InsertEnter * set nohlsearch]]
-- vim.cmd[[autocmd InsertLeave * :set hlsearch]]
vim.cmd[[set nuw=1]]
vim.cmd[[set autoindent]]
vim.cmd[[set cindent]]
vim.cmd[[set cursorline]]
vim.cmd[[set undofile]]
vim.cmd[[set undolevels=10000]]
vim.cmd[[set undodir=/mnt/a/nvim/undodir]]
vim.cmd([[autocmd FileType *c* set formatoptions-=ro]])
vim.cmd([[autocmd FileType *lua set formatoptions-=ro]])
--vim.cmd('command! QA :mksession! ./session.vim | qa')
-- vim.cmd([[autocmd BufAdd * :lua vim.api.nvim_buf_set_var(0, 'vim.g.numbers', false)]])

-- toggle line nr
function numbers()
	vim.cmd("set norelativenumber!")
	vim.cmd("set nonu!")
	-- vim.api.nvim_buf_set_var(0, 'vim.g.numbers', not vim.api.nvim_buf_get_var(0, 'vim.g.numbers'))
	-- vim.api.nvim_buf_set_var(vim.fn.bufnr('%'), 'vim.g.numbers', not vim.api.nvim_buf_get_var(0, 'vim.g.numbers'))
	vim.g.numbers = not vim.g.numbers
end

vim.cmd[[autocmd InsertLeave * :lua nbrLeave()]]
vim.cmd[[autocmd InsertEnter * :lua nbrEnter()]]

function nbrEnter()
	if vim.g.numbers == true then
		-- if vim.api.nvim_buf_get_var(0, 'vim.g.numbers') == true then
		-- if vim.api.nvim_buf_get_var(vim.fn.bufnr('%'), 'vim.g.numbers') == true then
			vim.cmd[[set norelativenumber]]
		-- end
	end
end

function nbrLeave()
	if vim.g.numbers == true then
		-- if vim.api.nvim_buf_get_var(0, 'vim.g.numbers') == true then
		-- if vim.api.nvim_buf_get_var(vim.fn.bufnr('%'), 'vim.g.numbers') == true then
			vim.cmd[[set relativenumber]]
		-- end
	end
end

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
