-- NOTE:
--
return {
  -- https://github.com/mfussenegger/nvim-lint
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile',
    -- 'BufWritePost'
  },
  config = function()
    -- Define a table of linters for each filetype (not extension).
    -- Additional linters can be found here: https://github.com/mfussenegger/nvim-lint#available-linters
    local lint = require 'lint'

    lint.linters_by_ft = {
      -- typescript = { "eslint_d" },
      -- javascriptreact = { "eslint_d" },
      -- typescriptreact = { "eslint_d" },
      -- svelte = { "eslint_d" },
      -- clojure = { "clj-kondo" },
      -- dockerfile = { "hadolint" },
      -- inko = { "inko" },
      -- janet = { "janet" },
      -- json = { "jsonlint" },
      -- markdown = { 'vale' },
      -- rst = { "vale" },
      -- ruby = { "ruby" },
      -- terraform = { "tflint" },
      -- text = { 'vale' },
      python = {
        -- Uncomment whichever linters you prefer
        -- 'flake8',
        -- 'mypy',
        'pylint',
      },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
