-- Auto-completion of bracket/paren/quote pairs
return {
  -- https://github.com/windwp/nvim-autopairs
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    check_ts = true, -- enable treesitter
    ts_config = {
      lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
      javascript = { 'template_string' }, -- don't add pairs in javascript template_string
    },
  },
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
