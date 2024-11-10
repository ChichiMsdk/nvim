local Terminal = require('toggleterm.terminal').Terminal

Wincmd1x = Terminal:new({
	on_open = function()
		vim.cmd("stopinsert")
		-- vim.cmd("startinsert!")
	end,
	shell = "pwsh.exe",
	count = 1
})

function Get_cmd_txt()
	local cwd = vim.fn.getcwd()
	local file_path = cwd .. '/cmd.txt'
	local file = io.open(file_path, "r")
	if not file then return nil end
	local command = file:read("*all")
	file:close()
	return command:gsub("\n", "")
end

-- Function to be called
function SendCommandToggleTerm()
	-- local command = Get_cmd_txt()
	vim.cmd(":lua vim.g.CmdLine = GetFavCommand(vim.fn.getcwd() .. '/.cmds')")
	local command = vim.g.CmdLine
	if command then
		-- vim.cmd("1TermExec cmd=" .. command)
		if Wincmd1x:is_open() then
			Wincmd1x:send(command, false)
		else
			Wincmd1x:toggle(10, "tab")
			Wincmd1x:send(command, false)
		end
	else
		print("No command found. Add one in .cmds")
	end
end

function _Wincmd1x_toggle()
	if Wincmd1x:is_float() and Wincmd1x:is_open() then
		Wincmd1x:close()
		Wincmd1x:open(10, "vertical")
	else
		Wincmd1x:toggle(10, "horizontal")
	end
end

function _Wincmd2x_toggle()
	if Wincmd1x:is_split() and Wincmd1x:is_open() then
		Wincmd1x:close()
		Wincmd1x:open(10, "tab")
	else
		Wincmd1x:toggle(10, "tab")
	end
end
