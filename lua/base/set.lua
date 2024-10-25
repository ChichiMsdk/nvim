local o = vim.opt
o.termguicolors = true
o.spr = true
o.nu= true
o.rnu= true
o.tabstop= 4
o.shiftwidth= 4
o.wrap= false
o.hlsearch=true
o.incsearch=true
o.scrolloff= 4
o.updatetime = 500
o.colorcolumn = ""
o.hidden = true
vim.g.mapleader=" "
vim.g.NERDTreeWinPos = "right"
vim.g.numbers=false

-- vim.api.nvim_buf_set_var(0, 'vim.g.numbers', false)
-- vim.cmd[[autocmd InsertEnter * set nohlsearch]]
-- vim.cmd[[autocmd InsertLeave * :set hlsearch]]
vim.cmd[[set wildoptions=tagfile]]
vim.cmd[[set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P]]
vim.cmd[[set guicursor=n-sm:block,i-c-ci-v-ve:ver25,r-cr-o:hor20,a:blinkwait400-blinkoff500-blinkon500-Cursor/lCursor]]
vim.cmd[[Gitsigns toggle_signs]]
vim.cmd[[lua vim.diagnostic.enable(false)]]
vim.cmd[[set shada=!,'100,<50,s10,h,rA:,rB:]]
vim.cmd[[set fillchars=fold:\ ]]
vim.cmd[[set foldmethod=indent]]
vim.cmd[[set foldlevel=1100]]
vim.cmd[[set title]]
vim.cmd[[set ruler]]
vim.cmd[[set more]]
vim.cmd[[set nuw=1]]
vim.cmd[[set mouse=a]]
vim.cmd[[set autoindent]]
vim.cmd[[set cindent]]
-- vim.cmd[[set cursorline]]
vim.cmd[[set undofile]]
vim.cmd[[set undolevels=10000]]
vim.cmd[[set undodir=/mnt/a/nvim/undodir]]
vim.cmd([[autocmd FileType *c* set formatoptions-=ro]])
vim.cmd([[autocmd FileType *lua set formatoptions-=ro]])
-- vim.cmd([[autocmd BufEnter * if winnr('$') == 1 | file | endif]])
-- vim.cmd([[autocmd! BufWinEnter * :file]])

-- vim.cmd('command! QA :mksession! ./session.vim | qa')
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
	-- if vim.g.numbers == true then
		-- if vim.api.nvim_buf_get_var(0, 'vim.g.numbers') == true then
		-- if vim.api.nvim_buf_get_var(vim.fn.bufnr('%'), 'vim.g.numbers') == true then
			vim.cmd[[set norelativenumber]]
		-- end
	-- end
end

function nbrLeave()
	-- if vim.g.numbers == true then
		-- if vim.api.nvim_buf_get_var(0, 'vim.g.numbers') == true then
		-- if vim.api.nvim_buf_get_var(vim.fn.bufnr('%'), 'vim.g.numbers') == true then
			vim.cmd[[set relativenumber]]
		-- end
	-- end
end

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
