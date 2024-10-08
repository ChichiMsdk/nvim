local Terminal = require('toggleterm.terminal').Terminal

local wincmd1x = Terminal:new({
	on_open = function(term)
		vim.cmd("stopinsert")
		-- vim.cmd("startinsert!")
	end,
	count = 1
})

--[[
function _wincmd1x_toggle()
	wincmd1x:toggle(10, "horizontal")
end
--]]

function get_cmd_txt()
	local cwd = vim.fn.getcwd()
	local file_path = cwd .. '/cmd.txt'
	local file = io.open(file_path, "r")
	if not file then return nil end
	local command = file:read("*all")
	file:close()
	return command:gsub("\n", "")
	-- return command
	-- return '"' .. command:gsub("\n", "") .. '"'
end

-- Function to be called
function intermediate()
	local command = get_cmd_txt()
	if command then
		-- vim.cmd("1TermExec cmd=" .. command)
		if wincmd1x:is_open() then
			wincmd1x:send(command, false)
			-- wincmd1x:toggle(10, "horizontal")
		else
			wincmd1x:toggle(10, "horizontal")
			wincmd1x:send(command, false)
		end
		-- print("1TermExec cmd=" .. command)
	else
		print("Command file not found or empty")
	end
end

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
