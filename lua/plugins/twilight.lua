-- NOTE: Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing.
-- Not performant so only enable when needed
return {
  {
    'folke/twilight.nvim',
    opts = {
      dimming = {
        inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
      context = 20, -- amount of lines we will try to show around the current line
      treesitter = true, -- use treesitter when available for the filetype
    },
    keys = {
      {
        '<leader>tw',
        '<cmd>Twilight<cr>',
        desc = 'Toggle twilight',
      },
    },
  },
}
