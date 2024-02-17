local dap, dapui = require("dap"), require("dapui")

--dap.adapters.codelldb = {
--  type = 'server',
--  port = "13000",
--  executable = {
--    command = '/Users/chmoussa/Downloads/dap/extension/adapter/codelldb',
--    args = {"--port", "13000"},
--  }
--}

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🍄', texthl='', linehl='', numhl=''})

dap.configurations.c = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	 -- return vim.fn.getcwd() .. '/a.out'
    end,
	args = function()
      return vim.split(vim.fn.input('Enter arguments: '), "")
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}

--[[
require('telescope').load_extension('dap')
vim.keymap.set('n', '<leader>la', function() open_debugger() end) 
vim.keymap.set('n', '<leader>ln', function() require"dap".step_over() end) 
vim.keymap.set('n', '<leader>le', function() double_click() end) 
vim.keymap.set('n', '<leader>lb', function() require"dap".
	toggle_breakpoint() end) 
vim.keymap.set('n', '<leader>ds', ':Telescope dap frames<CR>')
vim.keymap.set('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')
vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')

local a = true
function open_debugger()
	if a == true then
		require"dapui".setup()
		require"dapui".open()
	else
		require"dapui".close()
	end
	a = not a
end

function double_click()
	require"dapui".eval()
	require"dapui".eval()
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.setup()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
--]]
