-- NOTE: Indentation guides
return {
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  'lukas-reineke/indent-blankline.nvim',
  event = 'VeryLazy',
  -- NOTE:  See `:help ibl`
  main = 'ibl',
  opts = {
    enabled = true,
    indent = {
      char = '|',
    },
  },
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
