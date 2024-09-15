-- Code Tree Support / Syntax Highlighting
return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    auto_install = true, -- automatically install syntax support when entering new file type buffer
    ensure_installed = {
      'json',
      'javascript',
      'typescript',
      'tsx',
      'yaml',
      'html',
      'css',
      'prisma',
      'lua',
      'markdown',
      'markdown_inline',
      'svelte',
      'graphql',
      'bash',
      'vim',
      'dockerfile',
      'gitignore',
      'query',
      'vimdoc',
      'c',
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },
  },
  config = function(_, opts)
    local configs = require 'nvim-treesitter.configs'
    configs.setup(opts)
  end,
}
