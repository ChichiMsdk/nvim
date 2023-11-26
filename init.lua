require("base")
--vim.g.loaded_netrwPlugin = 1
-- set clipboard= using luascript
--vim.cmd("set clipboard=")
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
