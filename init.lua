require("base")
vim.g.SelectedLine = nil
vim.g.MakeLine = nil
--vim.g.loaded_netrwPlugin = 1
-- set clipboard= using luascript
--vim.cmd("set clipboard=")
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
-- vim.cmd("packadd termdebug")

local function scratch()
  vim.ui.input({ prompt = "Command: ", completion = "shellcmd", completion = "command" }, function(input)
    if input == nil then
      return
    elseif input == "scratch" then
      input = "echo('')"
    end
    local cmd = vim.api.nvim_exec(input, { output = true })
    local output = {}
    for line in cmd:gmatch("[^\n\r]+") do
      table.insert(output, line)
    end
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
    vim.api.nvim_win_set_buf(0, buf)
  end)
end

vim.keymap.set("n", "<leader>rr", scratch, { desc = "Command to scratch buffer" })

----------------------STARTUP---------------------------

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
vim.cmd(":lua vim.g.SelectedLine = GetFavCommand(vim.fn.getcwd() .. '/.cmds')")
vim.cmd(":lua vim.g.MakeLine = GetFavCommand(vim.fn.getcwd() .. '/.make')")
