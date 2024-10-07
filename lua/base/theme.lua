

--[[
vim.cmd[[set background=light]]
--]]
vim.cmd[[set background=dark]]
vim.cmd.colorscheme "gruber-darker"

vim.cmd[[hi Folded guibg=none]]
vim.cmd[[hi Folded guifg=#8a8980]]
vim.cmd[[hi Comment guifg=#8a8980]]
vim.cmd[[hi @lsp.type.comment guifg=#8a8980]]
vim.cmd[[hi LspSignatureActiveParameter guifg=#ffdd33 guibg=#453d41]]
vim.cmd[[hi Cursor guifg=Black guibg=#9e95c7]]
vim.cmd[[hi link @lsp.type.class GruberDarkerQuartz]]
vim.cmd[[hi link @lsp.type.type GruberDarkerQuartz]]
vim.cmd[[hi NormalFloat guibg=GruberDarkerBg0]]
vim.cmd[[hi QuickFixLine guibg=#212121]]
vim.cmd[[hi Cursor guifg=Black guibg=#e4e4ef]]

vim.cmd[[hi! link MatchParen Visual]]

vim.cmd[[hi @property guifg=#7a97a6]]
-- used to be guibg=181818
vim.cmd[[hi Normal guifg=#ffffff]]
vim.cmd[[hi TodobgTODO gui=bold guifg=black guibg=#6f8faf]]
vim.cmd[[hi TodofgTODO guifg=#6f8faf]]

vim.cmd[[set laststatus=2]]
vim.cmd[[set cmdheight=1]]
-- vim.cmd[[set winbar=%<%f\ %h%m%r]]
-- vim.cmd[[hi WinBar guibg=#1d1d1d guifg=#ffffff cterm=none gui=none]]
-- vim.cmd[[hi WinBarNC cterm=none gui=none]]

