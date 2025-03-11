local theme_path = vim.g.myvimrc .. "/lua/theme.vim"
vim.cmd('source ' .. theme_path)
-- vim.cmd('source ~/Appdata/Local/nvim/lua/theme.vim')

-- Make the prompt readable --

vim.g.terminal_color_0 = "#7f7f8c"  -- Black
vim.g.terminal_color_1 = "#cd5c5c"  -- DarkBlue
vim.g.terminal_color_2 = "#9acd32"  -- DarkGreen
vim.g.terminal_color_7 = "#666666"  -- LightGray, LightGrey, Gray, Grey
vim.g.terminal_color_8 = "#8a7f7f"  -- DarkGray, DarkGrey
vim.g.terminal_color_9 = "#ff0000"  -- Blue, LightBlue
vim.g.terminal_color_10 = "#89fb98" -- Green, LightGreen
vim.g.terminal_color_15 = "#ffffff" -- White

-- vim.cmd[[hi Visual guibg=#1c4449]]

-- vim.cmd[[hi TodobgTODO gui=bold guifg=#6f8faf]]
-- vim.cmd[[hi TodoBgNOTE gui=bold guifg=#9e95c7]]
-- vim.cmd[[hi TodoBgWARN gui=bold guifg=#ffdd33]]
-- vim.cmd[[hi TodoBgFIX gui=bold guifg=#f43841]]

-- vim.cmd[[hi IncSearch guifg=#000000 guibg=#ffdd33]]
-- vim.cmd[[hi Search guifg=none guibg=#333333]]

-- vim.cmd[[hi TodobgTODO gui=bold guifg=black guibg=#6f8faf]]
-- vim.cmd[[hi TodofgTODO guifg=#6f8faf]]

-- vim.cmd[[hi! link MatchParen Visual]]

-- vim.cmd[[hi @property guifg=#7a97a6]]

-- vim.cmd[[set winbar=%<%f\ %h%m%r]]
-- vim.cmd[[hi WinBar guibg=#1d1d1d guifg=#ffffff cterm=none gui=none]]
-- vim.cmd[[hi WinBarNC cterm=none gui=none]]

-- vim.g.terminal_color_3 = "#bdb76b"  -- DarkCyan
-- vim.g.terminal_color_4 = "#75a0ff"  -- DarkRed
-- vim.g.terminal_color_5 = "#eeee00"  -- DarkMagenta
-- vim.g.terminal_color_6 = "#cd853f"  -- Brown, DarkYellow
-- vim.g.terminal_color_11 = "#f0e68c" -- Cyan, LightCyan
-- vim.g.terminal_color_12 = "#6dceeb" -- Red, LightRed
-- vim.g.terminal_color_13 = "#ffde9b" -- Magenta, LightMagenta
-- vim.g.terminal_color_14 = "#ffa0a0" -- Yellow, LightYellow

--	gruber-darker		desert		terminal

--	#282828			#7f7f8c		terminal_color_0
--	#ff4f58			#cd5c5c         terminal_color_1
--	#73d936			#9acd32         terminal_color_2
--	#ffdd33			#bdb76b         terminal_color_3
--	#96a6c8			#75a0ff         terminal_color_4
--	#9e95c7			#eeee00         terminal_color_5
--	#96a6c8			#cd853f         terminal_color_6
--	#e4e4e4			#666666         terminal_color_7
--	#282828			#8a7f7f         terminal_color_8
--	#ff4f58			#ff0000         terminal_color_9
--	#73d936			#89fb98         terminal_color_10
--	#ffdd33			#f0e68c         terminal_color_11
--	#96a6c8			#6dceeb         terminal_color_12
--	#9e95c7			#ffde9b         terminal_color_13
--	#96a6c8			#ffa0a0         terminal_color_14
--	#e4e4e4			#c2bfa5         terminal_color_15
