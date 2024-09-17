-- :redir @* | set guifont | redir END
vim.g.mapleader = " "
vim.g.term_open = false
if vim.g.neovide then
	vim.g.neovide_scale_factor = 1.0

	vim.api.nvim_set_keymap("n", "<C-=>", ":lua change_scale_factor(1.05)<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<C-->", ":lua change_scale_factor(1/1.05)<CR>", { noremap = true })
	function change_scale_factor(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end

	vim.g.neovide_scroll_animation_length = 0.2
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.o.termguicolors = true
	vim.o.termpastefilter = "BS,HT,ESC,DEL,C0,C1"
	vim.g.neovide_input_use_logo = true
	vim.o.guifont = "JetBrainsMonoNL Nerd Font Mono:h12.9"
	-- vim.o.guifont = "GeistMono Nerd Font Mono:h16:#e-subpixelantialias:#h-none"
	vim.g.neovide_scale_factor = 1
	vim.opt.linespace = 0
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_cursor_vfx_mode = ""
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_no_idle = false
	vim.g.neovide_confirm_quit = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.3
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_fullscreen = false

	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0

	vim.cmd [[set shell=pwsh.exe]]
	vim.cmd [[set shellxquote=]]
	vim.cmd [[let &shellcmdflag = "-NoProfile -NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::PlainText;"]]
	vim.cmd [[let &shellquote   = '']]
	vim.cmd [[let &shellpipe    = '| Out-File -Encoding UTF8 %s']]
	vim.cmd [[let &shellredir   = '| Out-File -Encoding UTF8 %s']]
	vim.cmd [[let &shellquote = "" ]]
	vim.cmd [[let &shellxquote = "" ]]

	-- 	vim.api.nvim_set_keymap('n', '<C-F5>', ':!.\\build-all.bat<CR>', { noremap = true, silent = true })
	-- vim.keymap.set("n", "<C-F6>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_set_keymap('n', '<C-v>', '"+P', { noremap = true }) -- Paste normal mode
	vim.api.nvim_set_keymap('v', '<C-v>', '"+P', { noremap = true }) -- Paste visual mode
	vim.api.nvim_set_keymap('c', '<C-v>', '<C-R>+', { noremap = true }) -- Paste command mode
	vim.api.nvim_set_keymap('i', '<C-v>', '<C-R>+', { noremap = true }) -- Paste insert mode
end


-- Clipboard
vim.api.nvim_set_keymap('n', '<leader>x', ':Telescope neoclip<CR>', { noremap = true, silent = true })


--cmdline
-- vim.api.nvim_set_keymap('n', '<leader>;', ':', { noremap = true})

-- toggle line nr
-- vim.api.nvim_set_keymap('n', '<leader>rr', ':set rnu! | set nu!<CR>', { noremap = true, silent = true })

--BUILD
-- vim.api.nvim_set_keymap('n', '<C-F5>', ':1TermExec cmd="make"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F5>', ':Make<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _wincmd1x_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ti", "<cmd>lua _wincmd2x_toggle()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vo", ":Oil<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vv", ":Oil --float <CR>", { noremap = true, silent = true })

--comment line
vim.api.nvim_set_keymap("n", "<leader>/", ":TComment<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>/", ":TCommentBlock<CR>", { noremap = true, silent = true })

--copy to clipboard
vim.api.nvim_set_keymap('n', '<C-c>', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', 'yy', '"+y', { noremap = true })

--delete to blackhole buffer
vim.api.nvim_set_keymap('n', '<S-del>', '"_dd', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-del>', '"_d', { noremap = true })

--move between windows
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })

--cd in current buffer directory
vim.api.nvim_set_keymap('n', '<leader>c', ':lua mycd()<CR>', { noremap = true, silent = true })

--resize
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':resize +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':resize -1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':vertical resize +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':vertical resize -1<CR>', { noremap = true, silent = true })

--split windows
vim.api.nvim_set_keymap("n", "<leader>vs", ":vs<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vh", ":sp<CR>", { noremap = true, silent = true })

--center screen after scroll or search
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '{', '{zz', { noremap = true })
vim.api.nvim_set_keymap('n', '}', '}zz', { noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true })

--navigate/delete buffer, navigate/close tab
vim.api.nvim_set_keymap('n', '<leader>bd', ':b#<bar>bd #<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bm', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':Telescope jumplist<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>l', ':Trouble diagnostics toggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gy', 'gt', { noremap = true })
vim.api.nvim_set_keymap('n', 'gY', 'gT', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':wa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qq', ':QA<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':q<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>dd', [[:lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>]],
	{ noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<F5>', [[<Cmd>lua add_to_header_file()<CR>]], { noremap = true, silent = true })



---------------------------------- functions -----------------------------------

-- Set the mapping ^^^^^ toggle_term.lua
vim.api.nvim_set_keymap('n', '<C-F6>', ':lua intermediate()<CR>', { noremap = true, silent = true })

-- CD function
function mycd()
	local current_d = vim.fn.expand('%:p:h')
	vim.cmd('cd ' .. current_d)
end

-- Diagnostics

function ToggleDiagnostics()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

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
