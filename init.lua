require("base")
--vim.g.loaded_netrwPlugin = 1
-- set clipboard= using luascript
--vim.cmd("set clipboard=")
vim.cmd("tnoremap <Esc> <C-\\><C-n>")

vim.g.clipboard = {
         name= 'Win32yank',
         copy = {
			 ['+']= 'win32yank.exe -i --crlf',
			 ['*']= 'win32yank.exe -i --crlf',
          },
         paste= {
            ['+']= 'win32yank.exe -o --lf',
            ['*']= 'win32yank.exe -o --lf',
         },
         cache_enabled= 0,
      }
vim.api.nvim_exec('language en_US', true)
