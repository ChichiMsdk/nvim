require("base")
--vim.g.loaded_netrwPlugin = 1
-- set clipboard= using luascript
--vim.cmd("set clipboard=")
vim.cmd("tnoremap <Esc> <C-\\><C-n>")

vim.g.clipboard = {
         name= 'Win32yank',
         copy = {
			 ['+']= 'win32yank.exe -i --crlf',
			 ['*']= 'win32yank.exe -i --crlf',
          },
         paste= {
            ['+']= 'win32yank.exe -o --lf',
            ['*']= 'win32yank.exe -o --lf',
         },
         cache_enabled= 0,
      }
vim.api.nvim_exec('language en_US', true)

-- redirect output of command to scratch buffer
local function scratch()
  vim.ui.input({ prompt = "Command: ", completion = "command" }, function(input)
    if input == nil then
      return
    elseif input == "scratch" then
      input = "echo('')"
    end
    local cmd = vim.api.nvim_exec(input, { output = true })
    local output = {}
    for line in cmd:gmatch("[^\n]+") do
      table.insert(output, line)
    end
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
    vim.api.nvim_win_set_buf(0, buf)
  end)
end

vim.keymap.set("n", "<leader>rr", scratch, { desc = "Command to scratch buffer" })
