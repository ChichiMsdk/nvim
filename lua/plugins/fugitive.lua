return {
  'tpope/vim-fugitive',
  enabled = true,
  config = function()
    -- vim.keymap.set("n", "<leader>gg", ":set nospr<CR>:vertical Git<CR>:set spr<CR>:vert res 60<CR>:set winfixwidth<CR>:<BS>") -- to remove the command
    vim.keymap.set("n", "<leader>gg", ":horizontal Git<CR>") -- to remove the command
    vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
  end, 
}
