vim.g.mapleader = " "

vim.api.nvim_set_keymap("n","<leader>vv",":Ex<CR>", {noremap=true, silent=true})
--copy to clipboard
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', 'd', '"+d', { noremap = true })
vim.api.nvim_set_keymap('n', 'd', '"+d', { noremap = true })
--window navigation

vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent=true})
--resize window
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':resize +2<CR>', { noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':resize -2<CR>', { noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':vertical resize +2<CR>', { noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':vertical resize -2<CR>', { noremap = true, silent=true})
--vsplit&hsplit
vim.api.nvim_set_keymap("n","<leader>vs",":vs<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n","<leader>vh",":sp<CR>", {noremap=true, silent=true})

--center screen after scroll or search
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>M', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>M', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-d>', '<C-d>M', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-u>', '<C-u>M', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gy', 'gt', { noremap = true })
vim.api.nvim_set_keymap('n', 'gY', 'gT', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>aq', ':QA<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>aa', ':wincmd q<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>rr', ':set norelativenumber!<CR>', { noremap = true, silent = true })

local diagnostic_state = true

function ToggleDiagnostics()
    local bufnr = vim.api.nvim_get_current_buf()
    if diagnostic_state then
        vim.diagnostic.disable(bufnr)
    else
        vim.diagnostic.enable(bufnr)
    end
    diagnostic_state = not diagnostic_state
end

vim.api.nvim_set_keymap('n', '<leader>dd', [[:lua ToggleDiagnostics()<CR>]], {noremap = true, silent = true})
