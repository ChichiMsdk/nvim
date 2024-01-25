require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.2, -- percentage of the shade to apply to the inactive window
    },
    no_italic = true, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = {}, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
		mocha = {
--			base = "#11111a",
--			base = "#151515",
			base = "#171717",
			--base = "#000000",
			maroon = "#e7e7cb",
			lavender = "#c6ba9d",
			--base = "#000000",
			--black
		},
	},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
vim.cmd[[hi @function.builtin guifg=#7497d2]]
--vim.cmd[[hi LineNr guifg=#f77d31]]
vim.cmd[[hi LineNr guifg=#999999]]
vim.cmd[[hi StatusLine guifg=#FFee96 guibg=#151515]]
--vim.cmd[[hi StatusLine guifg=#998999 guibg=#11111a]]
