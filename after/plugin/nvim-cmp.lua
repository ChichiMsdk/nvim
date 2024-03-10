local luasnip = require('luasnip')

vim.keymap.set({'i', 'n', 'v'}, '<C-f>', function() luasnip.jump(1) end, {noremap=true, silent=true})
vim.keymap.set({'i', 'n', 'v'}, '<C-S-f>', function() luasnip.jump(-1) end, {noremap=true, silent=true})
vim.keymap.set({'i', 'n', 'v'}, '<C-m>', vim.lsp.buf.signature_help, {noremap=true, silent=true})
