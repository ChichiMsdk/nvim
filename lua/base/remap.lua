vim.g.mapleader = " "
vim.api.nvim_set_keymap("n","<leader>v",":NERDTreeToggle<CR>", {noremap=true, silent=true})
--copy to clipboard
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', 'd', '"+d', { noremap = true })
vim.api.nvim_set_keymap('n', 'd', '"+d', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

--center screen after scroll or search
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>M', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>M', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-d>', '<C-d>M', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-u>', '<C-u>M', { noremap = true })


vim.api.nvim_set_keymap('n', '<leader>r', ':set norelativenumber!<CR>', { noremap = true })
