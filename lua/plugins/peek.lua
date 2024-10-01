-- NOTE: Markdown preview plugin for Neovim
-- The text is a configuration for a Markdown preview plugin for Neovim.
-- It includes settings for the plugin, such as event triggers, build commands,
-- and user commands for opening and closing the preview. It also includes a
-- modeline for Vim settings.

return {
  'toppair/peek.nvim',
  event = { 'VeryLazy' },
  build = 'deno task --quiet build:fast',
  config = function()
    require('peek').setup()
    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
  end,
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
