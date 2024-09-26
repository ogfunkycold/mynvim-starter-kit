-- NOTE: the power to move lines and blocks!
--
return {
  -- https://github.com/fedepujol/move.nvim
  'fedepujol/move.nvim',
  opts = {
    --- Config
    setup = {
      keymaps = {
        noremap = true,
        silent = true,
        buffer = true,
      },
      line = {
        enable = true, -- Enables line movement
        indent = true, -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true, -- Toggles indentation
      },
      word = {
        enable = true, -- Enables word movement
      },
      char = {
        enable = false, -- Enables char movement
      },
    }, -- end of setup
  },
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
