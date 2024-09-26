-- NOTE: Git Blame
--
return {
  -- https://github.com/f-person/git-blame.nvim
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = false, -- disable by default, enabled only on keymap
    date_format = '%m/%d/%y %H:%M:%S', -- more concise date format
  },
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
