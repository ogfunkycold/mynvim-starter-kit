-- Auto-completion / Snippets
return {
  -- https://github.com/hrsh7th/nvim-cmp
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet engine & associated nvim-cmp source
    -- https://github.com/L3MON4D3/LuaSnip
    'L3MON4D3/LuaSnip',
    -- https://github.com/saadparwaiz1/cmp_luasnip
    'saadparwaiz1/cmp_luasnip',

    -- LSP completion capabilities
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lsp',

    -- Additional user-friendly snippets
    -- https://github.com/rafamadriz/friendly-snippets
    'rafamadriz/friendly-snippets',
    -- https://github.com/hrsh7th/cmp-buffer
    'hrsh7th/cmp-buffer',
    -- https://github.com/hrsh7th/cmp-path
    'hrsh7th/cmp-path',
    -- https://github.com/hrsh7th/cmp-cmdline
    'hrsh7th/cmp-cmdline',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {}

    local kind_icons = {
      Text = '󰉿',
      Method = 'm',
      Function = '󰊕',
      Constructor = '',
      -- Constructor = "",
      Field = '',
      Variable = '󰆧',
      Class = '󰌗',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '',
      Snippet = '',
      -- Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰇽',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰊄',
      Copilot = '', -- Add an icon for Copilot
    }
    cmp.setup {
      snippet = {
        -- { name = 'emoji' },
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- scroll backward
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- scroll forward
        ['<C-Space>'] = cmp.mapping.complete {}, -- show completion suggestions
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        -- Tab through suggestions or when a snippet is active, tab to the next argument
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        -- Tab backwards through suggestions or when a snippet is active, tab to the next argument
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' }, -- lsp
        { name = 'luasnip' }, -- snippets
        { name = 'copilot' }, -- copilot
        { name = 'buffer' }, -- text within current buffer
        { name = 'path' }, -- file system paths
      },
      -- NOTE: formatting modified from the default to add an entry for copilot
      --
      -- Explanation:
      -- 1. **kind_icons Table**: This table maps completion kinds to their respective icons. We added
      -- an entry for `Copilot` with an appropriate icon (`` in this case, but you can choose any icon
      -- you prefer).
      -- 2. **format Function**: The `format` function is responsible for formatting the completion items.
      -- We added an entry for `copilot` in the `menu` table to display `[Copilot]` next to suggestions
      -- from Copilot.
      -- Make sure that the `kind_icons` table is defined in the scope where the `format` function can access it. If `kind_icons` is already defined elsewhere in your configuration, you can simply add the `Copilot` entry to it.
      -- This should give you a visual indication that a suggestion is from Copilot in your completion menu.
      formatting = {
        expandable_indicator = true,
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          -- Set the kind icon
          vim_item.kind = string.format('%s', kind_icons[vim_item.kind] or '')
          -- Set the menu label
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',
            copilot = '[Copilot]', -- Add an entry for Copilot
          })[entry.source.name]
          return vim_item
        end,
      },
      -- Add borders to completions popups
      window = {
        -- Add borders to completions popups
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
