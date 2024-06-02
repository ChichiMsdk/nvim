return {
--	{
--		'zbirenbaum/copilot.lua',
--		cmd = "Copilot",
--		event = "InsertEnter",
--		config = function()
--			require("copilot").setup({})
--		end,
--	},
--	'gennaro-tedesco/nvim-peekup',
--	'junegunn/vim-peekaboo',
--	'cacharle/c_formatter_42.vim',
	-- 'tpope/vim-commentary',
	-- 'ThePrimeagen/git-worktree.nvim',
	'tpope/vim-dadbod',
	'tpope/vim-dispatch',
	'tpope/vim-eunuch',
	'tomtom/tcomment_vim',
	'nvim-treesitter/nvim-treesitter-textobjects',
	'nvim-pack/nvim-spectre',
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
	'hrsh7th/cmp-nvim-lsp-signature-help',
  	{ 'stevearc/oil.nvim', config = function() require("oil").setup()end},
	{ 'nvim-treesitter/nvim-treesitter'},
	{ 'catppuccin/nvim', as = "catppuccin" },
  	{'akinsho/toggleterm.nvim', version = "*", config = true},
	{
		"blazkowolf/gruber-darker.nvim",
		opts = {
			  bold = false,
			  invert = {
				signs = false,
				tabline = true,
				visual = false,
			  },
			  italic = {
				strings = false,
				comments = false,
				operators = false,
				folds = true,
			  },
			  undercurl = true,
			  underline = true,
		}
	},
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
		require("nvim-surround").setup()
		end
	},
	{
		'Theprimeagen/harpoon',
		branch = "harpoon2",
		commit = "e76cb03",
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},
	{
		'windwp/nvim-autopairs',
--		config = function() require("nvim-autopairs").setup ({}) end
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
			{'saadparwaiz1/cmp_luasnip'},
		}
	},
	--[[
	{
	  "ray-x/lsp_signature.nvim",
	  event = "VeryLazy",
	  opts = {},
	  config = function(_, opts) require'lsp_signature'.setup(opts) end
	},
	--]]
	--[[
	{
	"tversteeg/registers.nvim",
		cmd = "Registers",
		config = true,
		keys = {
				{ "\"",    mode = { "n", "v" } },
				{ "<C-R>", mode = "i" }
		},
		name = "registers",
	},
	--]]
}
