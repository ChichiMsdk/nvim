require("neodev").setup({
	{
	  library = {
	    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
	    -- these settings will be used for your Neovim config directory
	    runtime = true, -- runtime path
	    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
	    plugins = true, -- installed opt or start plugins in packpath
	    -- you can also specify the list of plugins to make available as a workspace library
	    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
	  },
	  setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
	  -- for your Neovim config directory, the config.library settings will be used as is
	  -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
	  -- for any other directory, config.library.enabled will be set to false
	  override = function(root_dir, options) end,
	  -- With lspconfig, Neodev will automatically setup your lua-language-server
	  -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
	  -- in your lsp start options
	  lspconfig = true,
	  -- much faster, but needs a recent built of lua-language-server
	  -- needs lua-language-server >= 3.6.0
	  pathStrict = true,
	}
})

local vim = vim
local lsp = require('lsp-zero').preset({
	documentation_window = {
		enable = true,
	},
	manage_nvim_cmp = {
		set_format = true,
		use_luasnip = true,
		set_sources = 'recommended',
	},
})

vim.cmd[[set pumheight=5]]
vim.cmd[[hi PmenuSel blend=0]]

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
})

vim.opt.signcolumn = 'no'
lsp.set_sign_icons({
	error = " ",
	warn = " ",
	hint = " ",
	info = " ",
})

lsp.on_attach(function (client, bufnr)
	local opts = {buffer = bufnr, silent = true}
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- vim.keymap.set("n", "<F29>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.open_float() end, opts)
end)

require('lspconfig').clangd.setup({
	 cmd = {
		  "clangd",
		  "--header-insertion=never",
		  "--limit-references=0",
		  "--background-index"
	  },
})

lsp.setup()

local cmp = require('cmp')
local function next_itm()
	if cmp.visible() then
		cmp.select_next_item()
	else
		cmp.complete()
	end
end

cmp.setup({
	enabled = function()
		-- disable completion in comments
		local context = require 'cmp.config.context'
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == 'c' then
			return true
		else
			return not context.in_treesitter_capture("comment")
			and not context.in_syntax_group("Comment")
		end
	end,
	mapping = {
		['<C-n>'] = cmp.mapping(next_itm),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-Space>'] = cmp.mapping.close(),
	},
	completion = {
		autocomplete = false,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
			return vim_item
		end
	},
})


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

