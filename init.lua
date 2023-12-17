-- wo is window options
-- bo is buffer options

vim.wo.number = true -- set number
vim.wo.relativenumber = true -- set rnu 
vim.bo.shiftwidth = 2 -- set shiftwidth=2
vim.bo.tabstop = 2 -- set tabstop=2
vim.bo.expandtab = true -- set expandtab
vim.wo.cursorline = true -- set cursorline
vim.g.termguicolors = true -- set termguicolors
vim.g.mapleader = " " -- set mapleader to <Space>
-- set mouse=a
-- filetype indent plugin on
-- set noswapfile

-- Bootstraps lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins") -- looks for plugins in ~/config/nvim/lua/plugins.lua
-- End of lazy.nvim initialization

-- Loads mason which installs LSPs
require("mason").setup()

-- Loads everforest colorscheme
require("everforest").load()

-- Loads nvim tree file explorer
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- set up for nvim-tree
require("nvim-tree").setup()

-- buffer line options
require('bufferline').setup({
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "buffer_id",
    separator_style = "thick",
    show_buffer_close_icons = false,
  }
})

-- initializes indent blank line
require("ibl").setup()

-- Key Mappings
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fx', builtin.git_commits, {})

-- Nvim Tree
vim.keymap.set('n', '<leader>zz', "<cmd>NvimTreeToggle<cr>")
vim.keymap.set('n', '<leader>zf', "<cmd>NvimTreeFindFile<cr>")

-- Key Bindings for Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { noremap = true }) 
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { noremap = true })

-- Switching buffers
vim.keymap.set('n', '<leader>h', '<cmd>bn<cr>', { noremap = true })
vim.keymap.set('n', '<leader>l', '<cmd>bp<cr>', { noremap = true })
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', { noremap = true })
