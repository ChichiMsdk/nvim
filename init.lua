require("base")
--vim.g.loaded_netrwPlugin = 1
-- set clipboard= using luascript
--vim.cmd("set clipboard=")
vim.g.peakaboo_window = 'horizontal botleft 30new'
vim.g.peekaboo_compact = 1
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
