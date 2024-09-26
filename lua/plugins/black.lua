-- NOTE: Python formatter
--
return {
  -- https://github.com/psf/black
  'psf/black',
  ft = 'python',
  config = function()
    -- Automatically format file buffer when saving
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      pattern = '*.py',
      callback = function()
        vim.cmd 'Black'
      end,
    })
  end,
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
