return {
	-- 'cacharle/c_formatter_42.vim',
	-- 'tpope/vim-commentary',
	-- 'tpope/vim-dadbod',
	{'tikhomirov/vim-glsl'},
	{"shortcuts/no-neck-pain.nvim", version = "*"},
	{'navarasu/onedark.nvim'},
	{'chentoast/marks.nvim'},
	{'tpope/vim-dispatch'},
	{'tpope/vim-eunuch'},
	{'tomtom/tcomment_vim'},

	{'nvim-treesitter/nvim-treesitter'},
	{'nvim-treesitter/nvim-treesitter-textobjects'},
	{'nvim-treesitter/nvim-treesitter-context'},
	{'nvim-treesitter/playground', event = "VeryLazy"},
	{'nvim-lua/plenary.nvim'},

	{'nvim-pack/nvim-spectre'},
	{'christoomey/vim-tmux-navigator'},
	{'nvim-tree/nvim-web-devicons'},
	{'folke/neodev.nvim'},
	{'mbbill/undotree'},
	{'tpope/vim-fugitive'},
	{'lewis6991/gitsigns.nvim'},

	{'windwp/nvim-autopairs'},
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'Diogo-ss/42-header.nvim'},
  	{ 'stevearc/oil.nvim', config = function() require("oil").setup()end},
  	{'akinsho/toggleterm.nvim', version = "*", config = true},

	{ "danymat/neogen", config = true, version = "*"},
	{ 'folke/todo-comments.nvim', dependencies = { {'nvim-lua/plenary.nvim' } }, opts = {} },
	{ 'AckslD/nvim-neoclip.lua', dependencies = {{'nvim-telescope/telescope.nvim'}}, event = "VeryLazy" },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { {'nvim-lua/plenary.nvim'} } },
	{ 'kylechui/nvim-surround', version = "*", config = function() require("nvim-surround").setup() end },

	-- THEMES
	{'rebelot/kanagawa.nvim', enabled = false },
	{ 'catppuccin/nvim', as = "catppuccin", enabled = false },
	{ 
		"blazkowolf/gruber-darker.nvim",
		opts = {
			  bold = false,
			  invert = { signs = false, tabline = true, visual = false, },
			  italic = { strings = false, comments = false, operators = false, folds = true, },
			  undercurl = true,
			  underline = true,
		}
	},
	{
		'Theprimeagen/harpoon',
		branch = "harpoon2",
		commit = "e76cb03",
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig', lazy = true},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip', lazy = true }, -- Required
			{'saadparwaiz1/cmp_luasnip'},
		},
		lazy = true
	},
}
