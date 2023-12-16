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
      'nvim-lualine/lualine.nvim',
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
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
}
