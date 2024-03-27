vim.g.mapleader = " "

if vim.g.neovide then

	vim.g.neovide_scale_factor = 1.0
	vim.api.nvim_set_keymap("n", "<C-=>", ":lua change_scale_factor(1.25)<CR>", {noremap = true})
	vim.api.nvim_set_keymap("n", "<C-->", ":lua change_scale_factor(1/1.25)<CR>", {noremap = true})
	function change_scale_factor(delta)
		  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	  end
	vim.g.neovide_scroll_animation_length = 0.2
 	vim.g.neovide_scroll_animation_far_lines = 0
	vim.o.termguicolors = true
	vim.o.termpastefilter = "BS,HT,ESC,DEL,C0,C1"
	vim.g.neovide_input_use_logo = true
	vim.o.guifont = "JetBrainsMonoNL Nerd Font Mono:h13"
--	vim.o.guifont = "GeistMono Nerd Font Mono:h16:#e-subpixelantialias:#h-none"
	vim.g.neovide_scale_factor = 1
	vim.opt.linespace = 2
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_cursor_vfx_mode = ""
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_no_idle = false
	vim.g.neovide_confirm_quit = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_refresh_rate = 144
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.3
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_fullscreen = false

	vim.cmd[[set shell=pwsh.exe]]
	vim.cmd[[set shellxquote=]]
	vim.cmd[[let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command ']]
	vim.cmd[[let &shellquote   = '']]
	vim.cmd[[let &shellpipe    = '| Out-File -Encoding UTF8 %s']]
	vim.cmd[[let &shellredir   = '| Out-File -Encoding UTF8 %s']]

	vim.api.nvim_set_keymap('n', '<C-F5>', ':!.\\build-all.bat<CR>', { noremap = true, silent = true })
	vim.keymap.set("n", "<C-F6>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true}) -- Copy
	vim.api.nvim_set_keymap('n', '<C-v>', '"+P', {noremap = true}) -- Paste normal mode
	vim.api.nvim_set_keymap('v', '<C-v>', '"+P', {noremap = true}) -- Paste visual mode
	vim.api.nvim_set_keymap('c', '<C-v>', '<C-R>+', {noremap = true}) -- Paste command mode
	vim.api.nvim_set_keymap('i', '<C-v>', '<C-R>+', {noremap = true}) -- Paste insert mode
end

--copilot toggle
vim.api.nvim_set_keymap("n","<F30>",":lua copilot_toggle()<CR>", {noremap=true, silent=true})
--vim.api.nvim_set_keymap("n","<leader>vv",":Ex<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n","<leader>vv",":Oil<CR>", {noremap=true, silent=true})
--vim.api.nvim_set_keymap("n","<leader>vv",":Oil --float <CR>", {noremap=true, silent=true})
--comment line
vim.api.nvim_set_keymap("n","<leader>/","0i// <ESC>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("v","<leader>/","0<S-i>// <ESC>", {noremap=true, silent=true})

--copy to clipboard
vim.api.nvim_set_keymap('n', '<C-c>', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })

vim.api.nvim_set_keymap('n', '<S-del>', '"_dd', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-del>', '"_d', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent=true})

vim.api.nvim_set_keymap('n', '<C-S-Up>', ':resize +2<CR>', { noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':resize -2<CR>', { noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':vertical resize +2<CR>', { noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':vertical resize -2<CR>', { noremap = true, silent=true})

vim.api.nvim_set_keymap("n","<leader>vs",":vs<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n","<leader>vh",":sp<CR>", {noremap=true, silent=true})
--center screen after scroll or search
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>M', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>M', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-d>', '<C-d>M', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-u>', '<C-u>M', { noremap = true })
--navigate/delete buffer, navigate/close tab
vim.api.nvim_set_keymap('n', '<leader>1', ':bprevious<CR>:lua print("b: " ..vim.api.nvim_get_current_buf())<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':bnext<CR>:lua print("b: " ..vim.api.nvim_get_current_buf())<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bn<bar>bd #<CR>', { noremap = true, silent = true })

--vim.api.nvim_set_keymap('n', '<leader>tt', ':tabnew<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>td', ':tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':vs|:wincmd l|:te<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':TroubleToggle<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gy', 'gt', { noremap = true })
vim.api.nvim_set_keymap('n', 'gY', 'gT', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':wa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qq', ':QA<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':xa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rr', ':set norelativenumber!<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap ('n', '<F7>', ':make<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap ('n', '<F41>', ':make && ./cub3d<CR>', { noremap = true, silent = true })

local diagnostic_state = true

function ToggleDiagnostics()
	local bufnr = vim.api.nvim_get_current_buf()
	if diagnostic_state then
		vim.diagnostic.disable(bufnr)
    else
        vim.diagnostic.enable(bufnr)
    end
    diagnostic_state = not diagnostic_state
end

vim.api.nvim_set_keymap('n', '<leader>dd', [[:lua ToggleDiagnostics()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F5>', [[<Cmd>lua add_to_header_file()<CR>]], { noremap = true, silent = true })

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
  vim.api.nvim_put({prototype}, 'l', true, true)
  vim.api.nvim_command('write')
  vim.api.nvim_command('b#')
  restore_win_view()
end

-- toggle for copilot
-- this is the command : Copilot disable and Copilot enable
vim.g.toggle_copilot = true
function copilot_toggle()
	if vim.g.toggle_copilot == true then
		require("copilot.suggestion").toggle_auto_trigger()
		print("Copilot enabled")
	else
		require("copilot.suggestion").toggle_auto_trigger()
		print("Copilot disabled")
	end
	vim.g.toggle_copilot = not vim.g.toggle_copilot
end

--  local h_file = io.open("example.h", "a")
--      if h_file then  -- Check if file is opened successfully
--		print("Adding prototype to" result )
--       h_file:write(prototype .. "\n")
--        h_file:close()
--      else
--        print("Could not open header file.")
--  end


