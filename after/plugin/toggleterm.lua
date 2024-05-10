local Terminal = require('toggleterm.terminal').Terminal

local wincmd1x = Terminal:new({
	on_open = function(term)
		vim.cmd("stopinsert")
		vim.cmd.wincmd({ args = { "x" }, count = 1 })
		vim.api.nvim_command('wincmd h')
		vim.cmd("startinsert!")
	end,
	hidden = true
})

function _wincmd1x_toggle()
	wincmd1x:toggle(68, "vertical")
end
