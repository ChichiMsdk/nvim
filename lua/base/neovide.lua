if vim.g.neovide then
	vim.g.neovide_scale_factor = 1.0

	vim.api.nvim_set_keymap("n", "<C-=>", ":lua change_scale_factor(1.05)<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<C-->", ":lua change_scale_factor(1/1.05)<CR>", { noremap = true })
	function change_scale_factor(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end

	vim.g.neovide_scroll_animation_length = 0.05
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_position_animation_length = 0.0
	-- vim.g.neovide_position_animation_length = 0.15

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
	vim.g.neovide_no_idle = true
	vim.g.neovide_confirm_quit = false
	vim.g.neovide_cursor_animate_command_line = true
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_cursor_trail_size = 0.0
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
