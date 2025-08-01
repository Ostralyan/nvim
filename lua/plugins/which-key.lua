return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require('which-key')
    
    wk.setup({
      preset = 'modern',
      delay = 300,
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      replace = {
        ['<space>'] = 'SPC',
        ['<cr>'] = 'RET',
        ['<tab>'] = 'TAB',
      },
      icons = {
        breadcrumb = '»',
        separator = '➜',
        group = '+',
        ellipsis = '…',
        mappings = true,
        rules = {},
        colors = true,
        keys = {
          Up = ' ',
          Down = ' ',
          Left = ' ',
          Right = ' ',
          C = '󰘴 ',
          M = '󰘵 ',
          D = '󰘳 ',
          S = '󰘶 ',
          CR = '󰌑 ',
          Esc = '󱊷 ',
          ScrollWheelDown = '󱕐 ',
          ScrollWheelUp = '󱕑 ',
          NL = '󰌑 ',
          BS = '󰁮',
          Space = '󱁐 ',
          Tab = '󰌒 ',
          F1 = '󱊫',
          F2 = '󱊬',
          F3 = '󱊭',
          F4 = '󱊮',
          F5 = '󱊯',
          F6 = '󱊰',
          F7 = '󱊱',
          F8 = '󱊲',
          F9 = '󱊳',
          F10 = '󱊴',
          F11 = '󱊵',
          F12 = '󱊶',
        },
      },
      keys = {
        scroll_down = '<c-d>',
        scroll_up = '<c-u>',
      },
      win = {
        border = 'rounded',
        position = 'bottom',
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
      },
      layout = {
        spacing = 3,
        align = 'left',
      },
      filter = function(mapping)
        return mapping.desc and mapping.desc ~= ''
      end,
      show_help = true,
      show_keys = true,
      triggers = {
        { '<auto>', mode = 'nixsotc' },
        { 's', mode = { 'n', 'v' } },
      },
    })

    -- Document existing key chains using the new v3 spec
    wk.add({
      -- Leader key groups
      { '<leader>f', group = 'find' },
      { '<leader>g', group = 'git' },
      { '<leader>h', group = 'hunks' },
      { '<leader>l', group = 'lsp' },
      { '<leader>s', group = 'split/search' },
      { '<leader>t', group = 'toggle' },
      { '<leader>x', group = 'diagnostics/trouble' },
      { '<leader>c', group = 'code' },
      { '<leader>r', group = 'rename/references' },

      -- Goto mappings
      { 'g', group = 'goto' },
      { 'gd', desc = 'Go to definition' },
      { 'gr', desc = 'Go to references' },
      { 'gR', desc = 'LSP References (Trouble)' },

      -- Navigation
      { '[', group = 'prev' },
      { '[d', desc = 'Previous diagnostic' },
      { '[c', desc = 'Previous hunk' },
      { ']', group = 'next' },
      { ']d', desc = 'Next diagnostic' },
      { ']c', desc = 'Next hunk' },

      -- LSP mappings
      { '<leader>rn', desc = 'Rename symbol' },
      { '<leader>ca', desc = 'Code actions' },
      { 'K', desc = 'Hover documentation' },

      -- Window management
      { '<leader>sv', desc = 'Split vertically' },
      { '<leader>sh', desc = 'Split horizontally' },
      { '<leader>sq', desc = 'Close current split' },
      { '<leader>so', desc = 'Close other splits' },

      -- Git mappings
      { '<leader>gs', desc = 'Git status' },
      { '<leader>gp', desc = 'Git push' },
      { '<leader>gP', desc = 'Git pull --rebase' },
      { '<leader>gb', desc = 'Toggle git blame' },
      { '<leader>gB', desc = 'Git blame' },
      { '<leader>gl', desc = 'Git log (current file)' },
      { '<leader>gL', desc = 'Git log' },
      { '<leader>gss', desc = 'Git status (FzfLua)' },
      { '<leader>gll', desc = 'Git commits' },
      { '<leader>glb', desc = 'Git commits (buffer)' },

      -- Hunk operations
      { '<leader>hs', desc = 'Stage hunk' },
      { '<leader>hr', desc = 'Reset hunk' },
      { '<leader>hS', desc = 'Stage buffer' },
      { '<leader>hu', desc = 'Undo stage hunk' },
      { '<leader>hR', desc = 'Reset buffer' },
      { '<leader>hp', desc = 'Preview hunk' },
      { '<leader>hb', desc = 'Blame line' },
      { '<leader>hd', desc = 'Diff this' },
      { '<leader>hD', desc = 'Diff this (cached)' },

      -- Toggle operations
      { '<leader>tb', desc = 'Toggle blame line' },
      { '<leader>td', desc = 'Toggle deleted' },

      -- FzfLua mappings
      { '<leader>ff', desc = 'Find files' },
      { '<leader>fb', desc = 'Find buffers' },
      { '<leader>fh', desc = 'Find help' },
      { '<leader>fr', desc = 'Find recent files' },
      { '<leader>fg', desc = 'Live grep' },
      { '<leader>fG', desc = 'Grep string' },
      { '<leader>fw', desc = 'Grep word' },
      { '<leader>fW', desc = 'Grep WORD' },
      { '<leader>fd', desc = 'Find diagnostics' },

      -- LSP mappings
      { '<leader>lr', desc = 'LSP references' },
      { '<leader>ls', desc = 'LSP document symbols' },
      { '<leader>lS', desc = 'LSP workspace symbols' },
      { '<leader>li', desc = 'LSP implementations' },
      { '<leader>ld', desc = 'LSP definitions' },
      { '<leader>lD', desc = 'LSP declarations' },
      { '<leader>lt', desc = 'LSP type definitions' },
      { '<leader>la', desc = 'LSP code actions' },

      -- Trouble mappings
      { '<leader>xx', desc = 'Toggle Trouble' },
      { '<leader>xw', desc = 'Workspace Diagnostics' },
      { '<leader>xd', desc = 'Document Diagnostics' },
      { '<leader>xq', desc = 'Quickfix' },
      { '<leader>xl', desc = 'Location List' },

      -- Visual mode mappings
      { '<leader>hs', desc = 'Stage hunk', mode = 'v' },
      { '<leader>hr', desc = 'Reset hunk', mode = 'v' },

      -- Terminal mode descriptions
      { '<C-h>', desc = 'Move to left pane', mode = 't' },
      { '<C-j>', desc = 'Move to pane below', mode = 't' },
      { '<C-k>', desc = 'Move to pane above', mode = 't' },
      { '<C-l>', desc = 'Move to right pane', mode = 't' },
      { '<Esc>', desc = 'Exit terminal mode', mode = 't' },
    })
  end,
}