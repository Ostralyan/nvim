require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'line'
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

local keymap = vim.keymap.set

-- KeyMaps
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
keymap('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
