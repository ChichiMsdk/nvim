local vim = vim
local lsp = require('lsp-zero').preset({
	documentation_window = {
		enable = true,
	}
})

vim.opt.signcolumn = 'no'
vim.cmd[[set pumheight=5]]
--vim.cmd[[set pumblend=60]]
vim.cmd[[hi PmenuSel blend=0]]

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
