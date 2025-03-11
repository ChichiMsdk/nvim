return {
  	'akinsho/toggleterm.nvim',
	version = "*",
	lazy = false,
	enabled = true,
	config = function()
		require("toggleterm").setup{
		    shell = vim.o.shell,
		}
		local Terminal = require('toggleterm.terminal').Terminal

		Wincmd1x = Terminal:new({
			on_open = function()
				-- vim.cmd("stopinsert")
				vim.cmd("startinsert!")
			end,
			shell = vim.o.shell,
			count = 1,
			start_in_insert = true,
		})
	end,
}
