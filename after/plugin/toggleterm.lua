local Terminal = require('toggleterm.terminal').Terminal

local wincmd1x = Terminal:new({
	on_open = function(term)
		vim.cmd("stopinsert")
		vim.cmd("startinsert!")
	end,
	hidden = true
})

--[[
function _wincmd1x_toggle()
	wincmd1x:toggle(10, "horizontal")
end
--]]

function _wincmd1x_toggle()
	if wincmd1x:is_float() and wincmd1x:is_open() then
		wincmd1x:close()
		wincmd1x:open(10, "horizontal")
	else
		wincmd1x:toggle(10, "horizontal")
	end
end

function _wincmd2x_toggle()
	if wincmd1x:is_split() and wincmd1x:is_open() then
		wincmd1x:close()
		wincmd1x:open(10, "float")
	else
		wincmd1x:toggle(10, "float")
	end
end
