require("config.lazy")

vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

local keymap = vim.keymap.set

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')
