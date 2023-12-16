-- wo is window options
-- bo is buffer options

vim.wo.number = true -- set number
vim.wo.relativenumber = true -- set rnu 
vim.bo.shiftwidth = 2 -- set shiftwidth=2
vim.bo.tabstop = 2 -- set tabstop=2
vim.bo.expandtab = true -- set expandtab
vim.wo.cursorline = true -- set cursorline
vim.g.termguicolors = true -- set termguicolors
-- set mouse=a
-- filetype indent plugin on
-- set noswapfile

-- vim.g.mapleader = " "

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

-- Loads everforest colorscheme
require("everforest").load()
