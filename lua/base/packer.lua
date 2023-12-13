-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	--	-- Packer can manage itself
	use 'cacharle/c_formatter_42.vim'
	use 'rebelot/kanagawa.nvim'
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use("christoomey/vim-tmux-navigator")
	use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
	})
--	use "preservim/nerdtree"
  	use({"stevearc/oil.nvim",config = function() require("oil").setup()end,})
	use 'nvim-tree/nvim-web-devicons'
	use "folke/neodev.nvim"
	use "nvim-lua/plenary.nvim"
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('nvim-treesitter/nvim-treesitter-context')
	use ('nvim-treesitter/playground')
	use {
		"Theprimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } }
	}
	use ('mbbill/undotree')
	use ('tpope/vim-fugitive')
	use ('neovim/nvim-lspconfig')
	use ('williamboman/mason.nvim')
	use ('williamboman/mason-lspconfig.nvim')
	use ('hrsh7th/nvim-cmp')
	use { "catppuccin/nvim", as = "catppuccin" }
	use ('hrsh7th/cmp-nvim-lsp')
	use {"Diogo-ss/42-header.nvim"}
	use ('mfussenegger/nvim-dap')
	use	('nvim-telescope/telescope-dap.nvim')
	use ('theHamsta/nvim-dap-virtual-text')
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	use ('ldelossa/nvim-dap-projects')
	use {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require('copilot').setup({
				panel = {
					enabled = false,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-0>"
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
					lua = true,
				},
				copilot_node_command = 'node', -- Node.js version must be > 16.x
				server_opts_overrides = {},
			})
		end,
	}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup ({}) end
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'}, -- Required
		}
	}
end)
