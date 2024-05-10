--local mark = require("harpoon.mark")
--local ui = require("harpoon.ui")
local harpoon = require("harpoon")
harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
}
)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>g", function() harpoon:list():add() end)
--vim.keymap.set("n", "<ESC>", function() harpoon.ui:close_quick_menu() end)

vim.keymap.set("n", "<M-f>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-d>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-s>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-a>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<M-v>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<M-c>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<M-x>", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<M-z>", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<M-j>", function() harpoon:list():select(9) end)
vim.keymap.set("n", "<M-k>", function() harpoon:list():select(10) end)
vim.keymap.set("n", "<M-n>", function() harpoon:list():select(11) end)
vim.keymap.set("n", "<M-m>", function() harpoon:list():select(12) end)
vim.keymap.set("n", "<M-,>", function() harpoon:list():select(13) end)
vim.keymap.set("n", "<M-.>", function() harpoon:list():select(14) end)
