-- NOTE:
--
-- Theme/Colorscheme (uncomment section for whichever theme you prefer or use your own)
-- Kanagawa Theme (Custom Palette)
-- return {
--   -- https://github.com/rebelot/kanagawa.nvim
--   'rebelot/kanagawa.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     transparent = true,
--     background = {
--       -- light = "lotus",
--       dark = 'wave', -- "wave, dragon"
--     },
--     colors = {
--       palette = {
--         -- Background colors
--         sumiInk0 = '#161616', -- modified
--         sumiInk1 = '#181818', -- modified
--         sumiInk2 = '#1a1a1a', -- modified
--         sumiInk3 = '#1F1F1F', -- modified
--         sumiInk4 = '#2A2A2A', -- modified
--         sumiInk5 = '#363636', -- modified
--         sumiInk6 = '#545454', -- modified
--
--         -- Popup and Floats
--         waveBlue1 = '#322C47', -- modified
--         waveBlue2 = '#4c4464', -- modified
--
--         -- Diff and Git
--         winterGreen = '#2B3328',
--         winterYellow = '#49443C',
--         winterRed = '#43242B',
--         winterBlue = '#252535',
--         autumnGreen = '#76A56A', -- modified
--         autumnRed = '#C34043',
--         autumnYellow = '#DCA561',
--
--         -- Diag
--         samuraiRed = '#E82424',
--         roninYellow = '#FF9E3B',
--         waveAqua1 = '#7E9CD8', -- modified
--         dragonBlue = '#7FB4CA', -- modified
--
--         -- Foreground and Comments
--         oldWhite = '#C8C093',
--         fujiWhite = '#F9E7C0', -- modified
--         fujiGray = '#727169',
--         oniViolet = '#BFA3E6', -- modified
--         oniViolet2 = '#BCACDB', -- modified
--         crystalBlue = '#8CABFF', -- modified
--         springViolet1 = '#938AA9',
--         springViolet2 = '#9CABCA',
--         springBlue = '#7FC4EF', -- modified
--         waveAqua2 = '#77BBDD', -- modified
--
--         springGreen = '#98BB6C',
--         boatYellow1 = '#938056',
--         boatYellow2 = '#C0A36E',
--         carpYellow = '#FFEE99', -- modified
--
--         sakuraPink = '#D27E99',
--         waveRed = '#E46876',
--         peachRed = '#FF5D62',
--         surimiOrange = '#FFAA44', -- modified
--         katanaGray = '#717C7C',
--       },
--     },
--   },
--   config = function(_, opts)
--     require('kanagawa').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd 'colorscheme kanagawa' -- Replace this with your favorite colorscheme
--
--     -- Custom diff colors
--     vim.cmd [[
--       autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
--       autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
--       autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
--       autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
--     ]]
--
--     -- Custom border colors
--     vim.cmd [[
--       autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=#1F1F1F
--       autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=#1F1F1F
--     ]]
--   end,
-- }
--
-- Kanagawa Theme (Original)
-- return {
--   -- https://github.com/rebelot/kanagawa.nvim
--   'rebelot/kanagawa.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     background = {
--       -- light = "lotus",
--       dark = "wave", -- "wave, dragon"
--     },
--   },
--   config = function(_, opts)
--     require('kanagawa').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme kanagawa") -- Replace this with your favorite colorscheme
--   end
-- }

-- Tokyo Night Theme
-- return {
--   -- https://github.com/folke/tokyonight.nvim
--   'folke/tokyonight.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     style = "night", -- other variations "storm, night, moon, day"
--   },
--   config = function(_, opts)
--     require('tokyonight').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme tokyonight") -- Replace this with your favorite colorscheme
--   end
-- }
--
-- return {
-- "folke/tokyonight.nvim",
-- priority = 1000,
-- config = function()
-- local bg = "#011628"
-- local bg_dark = "#011423"
-- local bg_highlight = "#143652"
-- local bg_search = "#0A64AC"
-- local bg_visual = "#275378"
-- local fg = "#CBE0F0"
-- local fg_dark = "#B4D0E9"
-- local fg_gutter = "#627E97"
-- local border = "#547998"
--
-- require("tokyonight").setup({
-- style = "night",
-- on_colors = function(colors)
-- colors.bg = bg
-- colors.bg_dark = bg_dark
-- colors.bg_float = bg_dark
-- colors.bg_highlight = bg_highlight
-- colors.bg_popup = bg_dark
-- colors.bg_search = bg_search
-- colors.bg_sidebar = bg_dark
-- colors.bg_statusline = bg_dark
-- colors.bg_visual = bg_visual
-- colors.border = border
-- colors.fg = fg
-- colors.fg_dark = fg_dark
-- colors.fg_float = fg
-- colors.fg_gutter = fg_gutter
-- colors.fg_sidebar = fg_dark
-- end
-- })
--
-- vim.cmd("colorscheme tokyonight")
-- end
-- }
-- }
-- Catppuccin Theme
-- return {
--   -- https://github.com/catppuccin/nvim
--   'catppuccin/nvim',
--   name = "catppuccin", -- name is needed otherwise plugin shows up as "nvim" due to github URI
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--   --   -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     flavour = "mocha", -- "latte, frappe, macchiato, mocha"
--   },
--   config = function(_, opts)
--     require('catppuccin').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme catppuccin") -- Replace this with your favorite colorscheme
--   end
-- }

-- Sonokai Theme
-- return {
--   -- https://github.com/sainnhe/sonokai
--   'sainnhe/sonokai',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function(_, opts)
--     vim.g.sonokai_style = "default" -- "default, atlantis, andromeda, shusia, maia, espresso"
--     vim.cmd("colorscheme sonokai") -- Replace this with your favorite colorscheme
--   end
-- }

-- One Nord Theme
-- return {
--   -- https://github.com/rmehri01/onenord.nvim
--   'rmehri01/onenord.nvim',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function(_, opts)
--     vim.cmd("colorscheme onenord") -- Replace this with your favorite colorscheme
--   end
-- }
-- -- NOTE: clean dark theme written in lua for neovim (0.7.2 or older).
-- -- NOTE: This is a fork of the original tokyodark.nvim by folke.
-- --
-- return {
--   { -- You can easily change to a different colorscheme.
--     -- Change the name of the colorscheme plugin below, and then
--     -- change the command in the config to whatever the name of that colorscheme is.
--     --
--     'tiagovla/tokyodark.nvim',
--     opts = {
--       -- custom options here
--       transparent_background = true, -- set background to transparent
--       gamma = 1.00, -- adjust the brightness of the theme
--     },
--     config = function(_, opts)
--       require('tokyodark').setup(opts) -- calling setup is optional
--       vim.cmd [[colorscheme tokyodark]] -- Toggle background transparency
--     end,
--   },
-- }
-- NOTE: original tokyionight.lua that is configured in kickstart
--
-- return {
--   { -- You can easily change to a different colorscheme.
--     -- Change the name of the colorscheme plugin below, and then
--     -- change the command in the config to whatever the name of that colorscheme is.
--     --
--     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--     'folke/tokyonight.nvim',
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     init = function()
--       -- Load the colorscheme here.
--       -- Like many other themes, this one has different styles, and you could load
--       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--       vim.cmd.colorscheme 'tokyonight-night'
--
--       -- You can configure highlights by doing something like:
--       vim.cmd.hi 'Comment gui=none'
--     end,
--   },
-- }
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- -- NOTE: solarized-osaka
-- return {
--   {
--     'craftzdog/solarized-osaka.nvim',
--     opts = {
--       --     -- custom options here
--       transparent = true,
--     },
--     config = function(_, opts)
--       require('solarized-osaka').setup(opts) -- calling setup is optional
--       vim.cmd [[colorscheme solarized-osaka]]
--     end,
--   },
-- }
-- -- NOTE: Neovim theme based off of the Nord Color Palette.
-- return {
--   'shaunsingh/nord.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Example config in lua
--     vim.g.nord_contrast = true
--     vim.g.nord_borders = false
--     vim.g.nord_disable_background = true
--     vim.g.nord_italic = false
--     vim.g.nord_uniform_diff_background = true
--     vim.g.nord_bold = false
--
--     -- Load the colorscheme
--     require('nord').set()
--
--     -- Toggle background transparency
--     local bg_transparent = true
--
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       vim.g.nord_disable_background = bg_transparent
--       vim.cmd [[colorscheme nord]]
--     end
--
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }
-- Catppuccin
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  ---@class CatppuccinOptions
  opts = function()
    vim.cmd.colorscheme 'catppuccin'
    return {
      flavour = 'mocha',
      transparent_background = true,
      color_overrides = {
        mocha = {
          base = '#000000',
        },
      },
      custom_highlights = function(colors)
        return {
          CurSearch = { bg = colors.yellow },
          Diffchanged = { fg = colors.yellow },
          DiffChanged = { fg = colors.yellow },
        }
      end,
      integrations = {
        cmp = true,
        fidget = true,
        gitsigns = true,
        harpoon = true,
        lsp_trouble = true,
        mason = true,
        nvim_surround = false,
        neotest = true,
        nvimtree = true,
        neotree = false,
        markdown = true,
        noice = true,
        notify = true,
        octo = true,
        telescope = {
          enabled = true,
        },
        render_markdown = true,
        treesitter = true,
        treesitter_context = false,
        symbols_outline = true,
        illuminate = true,
        which_key = true,
        barbecue = {
          dim_dirname = true,
          bold_basename = true,
          dim_context = false,
          alt_background = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
          },
        },
      },
      highlight_overrides = {
        mocha = function(mocha)
          return {
            NvimTreeNormal = { bg = mocha.none },
          }
        end,
      },
    }
  end,
}
-- onedarkpro
--[[ return {
  'olimorris/onedarkpro.nvim',
  name = 'onedarkpro',
  priority = 1000,
  config = function()
    require('onedarkpro').setup {
      options = {
        transparency = true,
        terminal_colors = true,
        lualine_transparency = true,
      },
      styles = {
        types = 'NONE',
        methods = 'NONE',
        numbers = 'NONE',
        strings = 'NONE',
        comments = 'italic',
        keywords = 'bold,italic',
        constants = 'NONE',
        functions = 'italic',
        operators = 'NONE',
        variables = 'NONE',
        parameters = 'NONE',
        conditionals = 'italic',
        virtual_text = 'NONE',
        Normal = 'NONE',
        Folded = 'NONE',
        SignColumn = 'NONE',
        Statusline = 'NONE',
        Tabline = 'NONE',
      },
    }
    vim.cmd 'colorscheme onedark_vivid'
  end,
} ]]

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
