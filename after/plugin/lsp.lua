local vim = vim
local lsp = require('lsp-zero').preset({
	documentation_window = {
		enable = true,
	}
})

vim.opt.signcolumn = 'yes'
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
})
vim.cmd[[set pumheight=5]]
--vim.cmd[[set pumblend=60]]
vim.cmd[[hi PmenuSel blend=0]]

lsp.set_sign_icons({
	error = " ",
	warn = " ",
	hint = " ",
	info = " ",
})

lsp.on_attach(function (client, bufnr)
	local opts = {buffer = bufnr, silent = true}
--	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.references.rename()<CR>", opts)
	vim.keymap.set("n", "<leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.open_float() end, opts)
end)

lsp.configure('clangd', {
  on_attach = function(client, bufnr)
	  cmd = {
		  "clangd",
		  "--offset-encoding=UTF-16",
	  }
  end
})


lsp.setup()

local cmp = require('cmp')
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
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
			return vim_item
		end
	},

})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
