-- :redir @* | set guifont | redir END
vim.g.mapleader = " "
vim.g.term_open = false
vim.g.cmdFile = '.cmds'
vim.g.makeFile = '.make'

-- Alias for convenience
function setLuaMap(mode, key, cmd, opts)
	if opts == nil then
		opts = {noremap = false, silent = false}
	end
	vim.api.nvim_set_keymap(mode, key, ':lua ' .. cmd .. '<CR>', {noremap = opts.noremap, silent = opts.silent})
end

-- Open output in buffer
vim.api.nvim_set_keymap("n", "<leader>rr",':lua scratch()<CR>', {noremap = true, silent = true})

-- Build the mapping is in toggle_term.lua
setLuaMap('n', '<C-F5>', 'MakeCommand()', {true, true})
vim.api.nvim_set_keymap('n', '<leader>cm', ":lua show_file_lines(vim.g.makeFile)<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cc', ":lua show_file_lines(vim.g.cmdFile)<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-F6>', ':lua SendCommandToggleTerm()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-F5>', ':Make<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-F5>', ':1TermExec cmd="make"<CR>', { noremap = true, silent = true })

-- Terminal / Telescope
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _wincmd1x_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>te", "<cmd>Telescope<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ti", "<cmd>lua _wincmd2x_toggle()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vo", ":Oil<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vv", ":Oil --float <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vc", ":Oil . --float <CR>", { noremap = true, silent = true })

-- Comment line
vim.api.nvim_set_keymap("n", "<leader>/", ":TComment<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>/", ":TCommentBlock<CR>", { noremap = true, silent = true })

-- Clipboard
vim.api.nvim_set_keymap('n', '<leader>cl', ':Telescope neoclip<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true })

-- Delete to blackhole buffer
vim.api.nvim_set_keymap('n', '<S-del>', '"_dd', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-del>', '"_d', { noremap = true })

-- Move between windows
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })

-- Cd in current buffer directory
vim.api.nvim_set_keymap('n', '<leader>kc', ':lua mycd("cd")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>kt', ':lua mycd("tcd")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>kl', ':lua mycd("lcd")<CR>', { noremap = true, silent = true })

-- Resize
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':resize +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':resize -1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':vertical resize +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':vertical resize -1<CR>', { noremap = true, silent = true })

-- Split windows
vim.api.nvim_set_keymap("n", "<leader>vs", ":vs<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vh", ":sp<CR>", { noremap = true, silent = true })

-- Center screen after scroll or search
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '{', '{zz', { noremap = true })
vim.api.nvim_set_keymap('n', '}', '}zz', { noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true })

-- Navigate/delete buffer, navigate/close tab
-- vim.api.nvim_set_keymap('n', '<leader>bd', ':b#<bar>bd #<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bn<bar>bd #<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bm', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>kk', ':Telescope jumplist<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>dl', ':Trouble diagnostics toggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gy', 'gt', { noremap = true })
vim.api.nvim_set_keymap('n', 'gY', 'gT', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qq', ':QA<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':q<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>dd', [[:lua diag_toggle()<CR>]], { noremap = true, silent = true })

-- cmdline
-- vim.api.nvim_set_keymap('n', '<leader>;', ':', { noremap = true})

-- toggle line nr
-- vim.api.nvim_set_keymap('n', '<leader>rr', ':set rnu! | set nu!<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<F5>', [[<Cmd>lua add_to_header_file()<CR>]], { noremap = true, silent = true })

---------------------------------- functions -----------------------------------


-- Redirect output of command to scratch buffer
function scratch()
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

-- Build
function MakeCommand()
	if vim.g.MakeLine then
		vim.cmd(vim.g.MakeLine)
	else
		print("No make command found. Add one in .make")
	end
end

-- Enable diagnostics
function diag_toggle()
	local is = vim.diagnostic.is_enabled()
	vim.diagnostic.enable(not is)
	local color = not is and "String" or "DiagnosticError"
	local status = not is and "Enabled" or "Disabled"
    vim.api.nvim_echo({{ "Diagnostics: ", "Normal" }, { status, color }}, true, {})
end

-- CD function
function mycd(cmd)
	local current_d = vim.fn.expand('%:p:h')
	vim.cmd(cmd .. ' ' .. current_d)
end
----

-- Saving view
local saved_views = {}

local function save_win_view()
	local current_buf = vim.api.nvim_get_current_buf()
	saved_views[current_buf] = vim.fn.winsaveview()
end

local function restore_win_view()
	local current_buf = vim.api.nvim_get_current_buf()
	if saved_views[current_buf] then
		vim.fn.winrestview(saved_views[current_buf])
	end
end
----

-- header !
function add_to_header_file()
	local line = vim.fn.getline('.')
	local prototype = line .. ";"
	local handle = io.popen('ls *.h')
	local result = handle:read("*a"):gsub('%s+$', '')
	handle:close()
	if result == "" then
		print("No header file found.")
	else
		print("Found header file(s): " .. result)
	end
	save_win_view()
	vim.api.nvim_command('edit ' .. result)
	vim.api.nvim_command('normal G')
	vim.api.nvim_command('normal k')
	vim.api.nvim_put({ prototype }, 'l', true, true)
	vim.api.nvim_command('write')
	vim.api.nvim_command('b#')
	restore_win_view()
end

--  local h_file = io.open("example.h", "a")
--      if h_file then  -- Check if file is opened successfully
--		print("Adding prototype to" result )
--       h_file:write(prototype .. "\n")
--        h_file:close()
--      else
--        print("Could not open header file.")
--  end
