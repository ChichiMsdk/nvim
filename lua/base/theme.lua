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
--			base = "#141414", --black 
			base = "#222222", -- gray
			maroon = "#e7e7cb",
			lavender = "#c6ba9d",
			Text = "#ffffff",
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
vim.cmd[[hi FloatBorder guifg=#cdd6f4]]
vim.cmd[[set guicursor=n-v:block-Cursor,i-ci-ve-c:ver80,r-cr:hor20-Cursor,o:hor50-Cursor]]
vim.cmd.colorscheme "catppuccin"
--vim.cmd.colorscheme "kanagawa"
vim.cmd[[hi String guifg=#98bb6c]]
vim.cmd[[hi TelescopeSelection guifg=#919090]]
vim.cmd[[hi TelescopeBorder guifg=#919090]]
vim.cmd[[hi FloatBorder guifg=#919090]]
vim.cmd[[hi NormalFloat guibg=#191919]]
vim.cmd[[hi @function.builtin guifg=#7497d2]]
--vim.cmd[[hi @function.builtin guifg=#2f2f2f]]
--vim.cmd[[hi LineNr guifg=#f77d31]]
vim.cmd[[hi CursorLine guibg=#191919]]
vim.cmd[[hi Cursor guibg=#979797 guifg=#cdd6f4]]
vim.cmd[[hi colorcolumn guibg=#191919]]
vim.cmd[[hi LineNr guifg=#999999]]
vim.cmd[[hi StatusLineNC guifg=#000000 guibg=#1a1a1a]]
vim.cmd[[hi StatusLine guifg=#999999 guibg=#303030]]
--vim.cmd[[hi StatusLine guifg=#998999 guibg=#11111a]]

require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false},
    statementStyle = { bold = false },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "lotus",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})
