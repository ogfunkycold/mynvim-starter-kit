-- NOTE: Plugin to improve viewing Markdown files in Neovim
--
return {
  'MeanderingProgrammer/render-markdown.nvim',
  web = { 'RenderMarkdown' },
  opts = {},
  dependencies = {
    -- NOTE: if you use the mini.nvim suite
    --
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',

    -- NOTE: if you use standalone mini plugins
    -- 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons'

    -- NOTE: if you prefer nvim-web-devicons
    -- 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('render-markdown').setup {
      -- NOTE: This plugin works with any buffer that has markdown injected anywhere. As a result
      -- it is not filetype specific and we allow users to specify which to run on.
      -- For example to run on both Markdown and Quarto files:
      file_types = { 'markdown', 'quatro' },
      -- NOTE:Render modes. In normal and command modes you'll get a rendered view,
      -- and in other modes such as insert the marks added by the plugin will disappear.
      render_modes = { 'n', 'v', 'i', 'c' },
      -- NOTE: Anti-conceal is a cursor row based behavior where any marks added by the plugin
      -- that are on the same row as your cursor (regardless of mode) will disappear.
      anti_conceal = { enabled = false },
      preset = 'none', -- The default value
      enabled = true,
    }
    require('obsidian').get_client().opts.ui.enable = false
    vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_get_namespaces()['ObsidianUI'], 0, -1)
  end,
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
