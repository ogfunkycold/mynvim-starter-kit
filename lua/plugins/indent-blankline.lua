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
