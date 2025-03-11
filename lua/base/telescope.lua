local builtin = require'telescope.builtin'
local sorters = require'telescope.sorters'
local finders = require'telescope.finders'
local actions = require'telescope.actions'
local lga_actions = require("telescope-live-grep-args.actions")

require('telescope').setup {
    extensions = {
	fzf = {
	    fuzzy = true,
	    override_generic_sorter = true,
	    override_file_sorter = true,
	    case_mode = "smart_case",
	},
	live_grep_args = {
	    auto_quoting = true, -- enable/disable auto-quoting
	    -- define mappings, e.g.
	    mappings = { -- extend mappings
		i = {
		    ["<C-k>"] = lga_actions.quote_prompt(),
		    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
		    -- freeze the current list and start a fuzzy search in the frozen list
		    ["<C-space>"] = lga_actions.to_fuzzy_refine,
		},
	    },
	},
    },
    defaults = {
	wrap_results = true,
	vimgrep_arguments = {
	    'rg',
	    '--color=never',
	    '--no-heading',
	    '--with-filename',
	    '--line-number',
	    '--column',
	    '--smart-case',
	    '--ignore-file',
	    '.gitignore',
	    '--ignore-file',
	    '.ignore'
	},
	path_display = {
	    "relative",
	},
	preview = true,
	previewer = true,
	file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
	grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
	qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
	selection_strategy = "reset",
	layout_strategy = 'vertical',
	layout_config = {
	    bottom_pane = {
		anchor = "SE",
		prompt_position = "top",
		mirror = true,
		height = 0.30,
		width = 0.30,
		height = 10,
		width = 10,
	    },
	    vertical = {
		mirror = true,
		preview_cutoff = 10,
		preview_width = 90,
		preview_height = 0.5,
		width = 0.5,
		height = 0.7,
	    },
	    flex = {
		flip_columns = 110,
	    },
	},
	mappings = {
	    i = {
		["<ESC>"] = actions.close,
		["<del>"] = actions.delete_buffer,
		["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
		["<C-S-q>"] = actions.add_to_qflist,
	    },
	},
    },
}

require'telescope'.load_extension('fzf')
require'telescope'.load_extension('live_grep_args')
--vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
--vim.keymap.set('n', '<leader>f', builtin.find_files, {})
--vim.keymap.set('n', '<leader>gl', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>gt', builtin.tags, {})
--vim.keymap.set('n', '<leader>ge', builtin.lsp_references, {})
--vim.keymap.set('n', '<leader>gs', builtin.grep_string, {})
--vim.keymap.set('n', '<leader>b', builtin.buffers, {})

vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function(args)
	vim.wo.wrap = true
    end,
})
