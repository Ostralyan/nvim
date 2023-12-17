return {
    -- everforest colorscheme
    {
      "neanias/everforest-nvim",
      lazy = true,
      priority = 1000,
      version = false,
    },
    -- lualine nvm status line 
    {
      "nvim-lualine/lualine.nvim",
      config = function()
        -- Loads lualine nvim status line
        require("lualine").setup({
        options = {
          theme = "everforest",
        }})
      end
    },
    -- comment nvim
    {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end
    },
    -- configuring the nvim lsp
    {
      "neovim/nvim-lspconfig",
      config = function()
      	require("lspconfig").tsserver.setup({})
      end
    },
    -- installing mason to manage lsps
    {
      "williamboman/mason.nvim"
    },
    -- adds telescope file search using fzf
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.5",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").setup({})
        require("telescope").load_extension('fzf')
      end
    },
    { 
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    {
      "nvim-tree/nvim-tree.lua",
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate"
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
    },
    {
      'akinsho/bufferline.nvim',
      version = "*",
      dependencies = 'nvim-tree/nvim-web-devicons'
    }
}
