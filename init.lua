require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'line'
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

-- Default indentation settings - always use spaces, never tabs
-- These will be overridden by guess-indent.nvim when it detects different settings
vim.opt.expandtab = true        -- Convert tabs to spaces
vim.opt.tabstop = 2             -- Number of spaces tabs count for (default)
vim.opt.shiftwidth = 2          -- Size of an indent (default)
vim.opt.softtabstop = 2         -- Number of spaces tabs count for in insert mode (default)
vim.opt.smartindent = true      -- Insert indents automatically
vim.opt.autoindent = true       -- Copy indent from current line when starting new line
vim.opt.breakindent = true      -- Enable break indent
vim.opt.shiftround = true       -- Round indent to multiple of shiftwidth

-- Set the color of all line numbers

-- Set the color of the current line number
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'red', bold = true })

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "white" })
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'red' }) -- Replace #AABBCC with your desired color
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "pink" })


-- Auto-reload files when changed outside of nvim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  desc = "Check for external file changes"
})

vim.opt.updatetime = 1000

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

-- Terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


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

