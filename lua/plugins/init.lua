-- Default config
return {
	-- 'cacharle/c_formatter_42.vim',
	-- 'tpope/vim-commentary',
	-- 'tpope/vim-dadbod',
	-- {'nvim-pack/nvim-spectre', lazy = true},
	-- {'christoomey/vim-tmux-navigator'},
	-- {"shortcuts/no-neck-pain.nvim", version = "*"},
	-- { "danymat/neogen", config = true, version = "*", enabled = false},
	-- {'lewis6991/gitsigns.nvim', enabled = false},

	{'tikhomirov/vim-glsl'},
	{'tpope/vim-dispatch'},
	{'tpope/vim-eunuch'},
	-- {'tpope/vim-obsession'},
	{'tomtom/tcomment_vim'},

	{'nvim-lua/plenary.nvim'},
	{'nvim-tree/nvim-web-devicons'},
	{'mbbill/undotree'},
	{ 'kylechui/nvim-surround', version = "*", config = function() require("nvim-surround").setup() end, lazy = false },
	{ 
	    'nvim-telescope/telescope-fzf-native.nvim', 
	    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
	},
	-- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

	-- LSP related
    --[[
	{'neovim/nvim-lspconfig', enabled = false},
	{'williamboman/mason.nvim', enabled = false},
	{'williamboman/mason-lspconfig.nvim', enabled = false},
	{'hrsh7th/cmp-nvim-lsp', enabled = false},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig', lazy = true, enabled = false},-- Required
			{'williamboman/mason.nvim', enabled = false},           -- Optional
			{'williamboman/mason-lspconfig.nvim', enabled = false}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp', enabled = false}, -- Required
			{'L3MON4D3/LuaSnip', lazy = false, enabled = false }, -- Required
			{'saadparwaiz1/cmp_luasnip', enabled = false},
		},
		lazy = true,
		enabled = false
	},
    --]]
}
