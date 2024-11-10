require("base")
vim.g.CmdLine = nil
vim.g.MakeLine = nil

vim.cmd("tnoremap <Esc> <C-\\><C-n>")

vim.api.nvim_exec('language en_US', true)

function GetFavCommand(file_path)
	local file = io.open(file_path, "r")
	if not file then return nil end
	local command = file:read("*L")
	file:close()
	if command and string.sub(command, 1, 7) == "[FAV]->" then
		temp = command:gsub("\n", "")
		temp = string.sub(temp, 8, string.len(temp))
		-- print("temp: " .. temp)
		return temp
	else
		return nil
	end
end

vim.cmd(":lua vim.g.CmdLine = GetFavCommand(vim.fn.getcwd() .. '/.cmds')")
vim.cmd(":lua vim.g.MakeLine = GetFavCommand(vim.fn.getcwd() .. '/.make')")


--vim.g.loaded_netrwPlugin = 1
-- set clipboard= using luascript
--vim.cmd("set clipboard=")

--[[
-- For wsl2 
vim.g.clipboard = {
	name = 'Win32yank',
	copy = {
		['+'] = 'win32yank.exe -i --crlf',
		['*'] = 'win32yank.exe -i --crlf',
	},
	paste = {
		['+'] = 'win32yank.exe -o --lf',
		['*'] = 'win32yank.exe -o --lf',
	},
	cache_enabled = 0,
}
--]]
