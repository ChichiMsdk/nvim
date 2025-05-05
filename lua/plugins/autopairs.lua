return {
  {
    'windwp/nvim-autopairs', 
    enabled = true,
    config = function()

      local npairs = require("nvim-autopairs")
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')

      npairs.setup({
        fast_wrap = {},
      })
    end, 
  },
}
