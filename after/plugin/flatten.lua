require("flatten").setup({
  window = {
    open = "smart",
  },
  nest_if_no_args = true,
  integrations = {
  },
  callbacks = {
    should_block = function(argv)
      return vim.tbl_contains(argv, "-b")
    end,
    -- should_nest = function(argv)
    --   -- return vim.tbl_contains(argv, "-n")
    --   return false
    -- end,
    post_open = function(opts)
      local bufnr, winnr, ft, is_blocking, is_diff =
        opts.bufnr, opts.winnr, opts.filetype, opts.is_blocking, opts.is_diff

      if is_blocking and saved_terminal then
        -- Hide the terminal while it's blocking
        saved_terminal:close()
      elseif not is_diff then
        -- If it's a normal file, just switch to its window
        vim.api.nvim_set_current_win(winnr)
      end

      -- If the file is a git commit, create one-shot autocmd to delete its buffer on write
      -- If you just want the toggleable terminal integration, ignore this bit
      if ft == "gitcommit" or ft == "gitrebase" then
        -- vim.schedule(vim.cmd.startinsert)
        vim.api.nvim_create_autocmd("BufWritePost", {
          buffer = bufnr,
          once = true,
          callback = vim.schedule_wrap(function()
            require("bufdelete").bufdelete(bufnr, true)
          end),
        })
      end
    end,
  },
})
