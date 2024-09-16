-- NOTE: A neovim plugin to persist and toggle multiple terminals during an editing session
--
return {
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = { 'ToggleTerm' },
    --[[     keys = {
      { 'n', '<leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true } },
      { 't', '<leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true } },
    }, ]]
    config = function()
      require('toggleterm').setup {
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shading_factor = 2,
        shade_filetypes = {},
        shade_terminals = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = false,
        direction = 'float',
        close_on_exit = true, -- close the terminal window when the process exits
        shell = nil, -- change the default shell
        float_opts = {
          border = 'rounded',
          winblend = 0,
          highlights = {
            border = 'Normal',
            background = 'Normal',
          },
        },
        winbar = {
          enabled = true,
          name_formatter = function(term) --  term: Terminal
            return term.count
          end,
        },
      }
    end,
  },
}
