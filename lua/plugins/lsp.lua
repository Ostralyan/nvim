return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",  -- Use blink instead of nvim-cmp
  },
  config = function()
    require("mason").setup()
    
    require("mason-lspconfig").setup({
      ensure_installed = { 
        "lua_ls",           -- Neovim config
        "pyright",          -- Python
        "ts_ls",            -- TypeScript
        "html",             -- HTML
        "cssls",            -- CSS
      },
      automatic_installation = true,
    })
    
    -- Get blink capabilities (different from nvim-cmp)
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    
    local lspconfig = require("lspconfig")
    
    -- Python setup
    lspconfig.pyright.setup({
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          }
        }
      }
    })
    
    -- TypeScript setup
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })
    
    -- Lua setup (for Neovim config)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })
  end,
}
