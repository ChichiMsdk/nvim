local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('lazy').setup({
	'cacharle/c_formatter_42.vim',
	'rebelot/kanagawa.nvim',
	'lewis6991/gitsigns.nvim',
	'christoomey/vim-tmux-navigator',
	'nvim-tree/nvim-web-devicons',
	'folke/neodev.nvim',
	"nvim-lua/plenary.nvim",
	'nvim-treesitter/nvim-treesitter-context',
	'nvim-treesitter/playground',
	'mbbill/undotree',
	'tpope/vim-fugitive',
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	"Diogo-ss/42-header.nvim",
	'mfussenegger/nvim-dap',
	'nvim-telescope/telescope-dap.nvim',
	'theHamsta/nvim-dap-virtual-text',
	'ldelossa/nvim-dap-projects',
	{
		'folke/todo-comments.nvim',
		dependencies = { {'nvim-lua/plenary.nvim' } },
		opts = {}
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	{
		'kylechui/nvim-surround',
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
		require("nvim-surround").setup({})
		end
	},
  	{ 'stevearc/oil.nvim', config = function() require("oil").setup()end},
	{ 'nvim-treesitter/nvim-treesitter',
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	},
	{ 'rcarriga/nvim-dap-ui', dependencies = {'mfussenegger/nvim-dap'} },
	{ 'catppuccin/nvim', as = "catppuccin" },
	{
		'Theprimeagen/harpoon',
		branch = "harpoon2",
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},
	{
		'windwp/nvim-autopairs',
		config = function() require("nvim-autopairs").setup ({}) end
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'}, -- Required
		}
	},
	})
