--  NOTE: This file is the entry point for the Neovim configuration.
--
-- Bootstrap lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- Initialize lazy with dynamic loading of anything in the plugins directory
require('lazy').setup {

  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  --
  require 'plugins.file-explorer',
  require 'plugins.colorscheme',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.nvim-lspconfig',
  require 'plugins.nvim-cmp',
  require 'plugins.mini',
  require 'plugins.alpha',
  require 'plugins.which-key',
  require 'plugins.harpoon',
  require 'plugins.comment',
  require 'plugins.conform',
  require 'plugins.autopairs',
  require 'plugins.todo-comments',
  require 'plugins.vim-isort',
  require 'plugins.quickfixdd',
  require 'plugins.indent-blankline',
  require 'plugins.nvim-surround',
  require 'plugins.vim-maximizer',
  require 'plugins.sleuth',
  require 'plugins.movelines',
  require 'plugins.barbecue',
  require 'plugins.bigfile',
  require 'plugins.black',
  require 'plugins.lazygit',
  require 'plugins.neogit',
  require 'plugins.git-blame',
  require 'plugins.git-signs',
  require 'plugins.nvim-dap-python',
  require 'plugins.nvim-dap-ui',
  require 'plugins.nvim-dap-virtual-text',
  require 'plugins.nvim-lint',
  require 'plugins.copilot',
  require 'plugins.gpt-prompts',
  require 'plugins.obsidian',
  require 'plugins.vim-rest-console',
  require 'plugins.vim-tmux-navigator',
  require 'plugins.markdown-nvim',
  require 'plugins.markdown-render',
  require 'plugins.markdown-preview',
  require 'plugins.peek',
  require 'plugins.incline',
  require 'plugins.toggleterm',
  require 'plugins.zenmode',
  require 'plugins.diffview',
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- turn off notifications whenever plugin changes are made
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}
-- These modules are not loaded by lazy

-- NOTE: move all general options vim.g and vim.o to xxx.options
require 'core.options'

-- NOTE: load general keymap
require 'core.keymaps'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
