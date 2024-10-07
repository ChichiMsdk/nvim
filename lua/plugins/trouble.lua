return {
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
 opts = {
	 modes = {
		 my_diagnostics = {
			 mode = 'diagnostics',
			 filter = {
				 ['not'] = {ft = 'lua'},
			 },
		 },
	 },
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
 },
}
