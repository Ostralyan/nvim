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

-- Add these for terminal mode navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Terminal: move left' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Terminal: move down' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Terminal: move up' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Terminal: move right' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Easier window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left pane' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to pane below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to pane above' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right pane' })

-- Window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontally' })
vim.keymap.set('n', '<leader>sq', '<C-w>q', { desc = 'Close current split' })
vim.keymap.set('n', '<leader>so', '<C-w>o', { desc = 'Close other splits' })

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase height' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease height' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease width' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase width' })
