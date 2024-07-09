vim.cmd.colorscheme "gruber-darker"

vim.cmd[[hi Folded guibg=none]]
vim.cmd[[hi Folded guifg=#8a8980]]
vim.cmd[[hi @lsp.type.comment guifg=#8a8980]]
vim.cmd[[hi LspSignatureActiveParameter guifg=#ffdd33 guibg=#453d41]]
vim.cmd[[hi Cursor guifg=Black guibg=#9e95c7]]
vim.cmd[[hi link @lsp.type.class GruberDarkerQuartz]]
vim.cmd[[hi link @lsp.type.type GruberDarkerQuartz]]
vim.cmd[[hi NormalFloat guibg=GruberDarkerBg0]]
-- vim.cmd[[hi TodoBgTODO guibg=#d95d9e]]

vim.cmd[[set laststatus=2]]
vim.cmd[[set cmdheight=1]]
-- vim.cmd[[set winbar=%<%f\ %h%m%r]]
-- vim.cmd[[hi WinBar guibg=#1d1d1d guifg=#ffffff cterm=none gui=none]]
-- vim.cmd[[hi WinBarNC cterm=none gui=none]]
