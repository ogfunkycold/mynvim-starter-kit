-- NOTE: A neovim plugin to persist and toggle multiple terminals during an editing session
--
-- return {
--   {
--     'akinsho/toggleterm.nvim',
--     lazy = true,
--     cmd = { 'ToggleTerm' },
--     --[[     keys = {
--       { 'n', '<leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true } },
--       { 't', '<leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true } },
--     }, ]]
--     config = function()
--       require('toggleterm').setup {
--         size = 20,
--         open_mapping = [[<c-\>]],
--         hide_numbers = true, -- hide the number column in toggleterm buffers
--         shading_factor = 2,
--         shade_filetypes = {},
--         shade_terminals = true,
--         insert_mappings = true, -- whether or not the open mapping applies in insert mode
--         persist_size = false,
--         direction = 'float',
--         close_on_exit = true, -- close the terminal window when the process exits
--         shell = nil, -- change the default shell
--         float_opts = {
--           border = 'rounded',
--           winblend = 0,
--           highlights = {
--             border = 'Normal',
--             background = 'Normal',
--           },
--         },
--         winbar = {
--           enabled = true,
--           name_formatter = function(term) --  term: Terminal
--             return term.count
--           end,
--         },
--       }
--     end,
--   },
-- }
return {
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = { 'ToggleTerm' },
    keys = {
      {
        '<leader>Tf',
        function()
          local count = vim.v.count1
          require('toggleterm').toggle(count, 0, vim.loop.cwd(), 'float')
        end,
        desc = 'ToggleTerm (float root_dir)',
      },
      {
        '<leader>Th',
        function()
          local count = vim.v.count1
          require('toggleterm').toggle(count, 15, vim.loop.cwd(), 'horizontal')
        end,
        desc = 'ToggleTerm (horizontal root_dir)',
      },
      {
        '<leader>Tv',
        function()
          local count = vim.v.count1
          require('toggleterm').toggle(count, vim.o.columns * 0.4, vim.loop.cwd(), 'vertical')
        end,
        desc = 'ToggleTerm (vertical root_dir)',
      },
      {
        '<leader>Tn',
        '<cmd>ToggleTermSetName<cr>',
        desc = 'Set term name',
      },
      {
        '<leader>Ts',
        '<cmd>TermSelect<cr>',
        desc = 'Select term',
      },
      {
        '<leader>Tt',
        function()
          require('toggleterm').toggle(1, 100, vim.loop.cwd(), 'tab')
        end,
        desc = 'ToggleTerm (tab root_dir)',
      },
      {
        '<leader>TT',
        function()
          require('toggleterm').toggle(1, 100, vim.loop.cwd(), 'tab')
        end,
        desc = 'ToggleTerm (tab cwd_dir)',
      },
    },
    opts = {
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      -- on_open = fun(t: Terminal), -- function to run when the terminal opens
      -- on_close = fun(t: Terminal), -- function to run when the terminal closes
      -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
      -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
      -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      -- shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      direction = 'horizontal' or 'vertical' or 'window' or 'float',
      -- direction = "vertical",
      close_on_exit = true, -- close the terminal window when the process exits
      -- shell = vim.o.shell, -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      -- float_opts = {
      --   -- The border key is *almost* the same as 'nvim_open_win'
      --   -- see :h nvim_open_win for details on borders however
      --   -- the 'curved' border is a custom border type
      --   -- not natively supported but implemented in this plugin.
      --   border = 'single' or 'double' or 'shadow' or 'curved',
      --   width = <value>,
      --   height = <value>,
      --   winblend = 3,
      --   highlights = {
      --     border = "Normal",
      --     background = "Normal",
      --   }
      -- }
    },
  },
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
