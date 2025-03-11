vim.g.myvimrc = vim.fn.expand('<sfile>:p:h')
local set_path = vim.g.myvimrc .. "/lua/set.vim"
local better_tags_path = vim.g.myvimrc .. "/lua/better_tags.vim"
vim.cmd('source ' .. set_path)

-- vim.cmd('source ~/Appdata/Local/nvim/lua/set.vim')
require("base")
-- require("commander\\main")

vim.g.CmdLine = nil
vim.g.MakeLine = nil

vim.cmd('source ' .. better_tags_path)
-- vim.cmd('source ~/Appdata/Local/nvim/lua/better_tags.vim')
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
