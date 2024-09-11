-- NOTE: This is a fork of the original nvim-dap-python plugin
--
return {
  -- https://github.com/mfussenegger/nvim-dap-python
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
  },
  config = function()
    -- Update the path passed to setup to point to your system or virtual env python binary
    -- python 3.10
    -- require('dap-python').setup('/usr/bin/python3')
    -- python 3.11
    require('dap-python').setup '/home/og/anaconda3/bin/python3'
  end,
}
