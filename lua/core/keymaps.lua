-- Last Change: 2021-01-31 16:00:00
-- NOTE: Keymaps for nvim configuration
--
-- For conciseness
local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

local opts = { noremap = true, silent = true }

local keymap = vim.keymap

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Window Navigation simpler (?)
keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the left window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('ovim-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Exit insert mode
map('i', 'jk', '<ESC>')

-- General keymaps
map('n', '<leader>wq', ':wq<CR>') -- save and quit
map('n', '<leader>qq', ':q!<CR>') -- quit without saving
map('n', '<leader>ww', ':w<CR>') -- save
map('n', 'gx', ':!open <c-r><c-a><CR>') -- open URL under cursor
--
-- Buffers
map('n', '<Tab>', ':bnext<CR>')
map('n', '<leader>n', ':bn<cr>')
map('n', '<S-Tab>', ':bprevious<CR>')
map('n', '<leader>p', ':bp<cr>')
map('n', '<leader>x', ':Bdelete!<CR>') -- close buffer
map('n', '<leader>x', ':bd<cr>')
map('n', '<leader>b', '<cmd> enew <CR>') -- new buffer

-- Resize Windows
map('n', '<C-Left>', '<C-w><')
map('n', '<C-Right>', '<C-w>>')
map('n', '<C-Up>', '<C-w>+')
map('n', '<C-Down>', '<C-w>-')

-- Split window management
map('n', '<leader>sv', '<C-w>v') -- split window vertically
map('n', '<leader>sh', '<C-w>s') -- split window horizontally
map('n', '<leader>se', '<C-w>=') -- make split windows equal width
map('n', '<leader>sx', ':close<CR>') -- close split window
map('n', '<leader>sj', '<C-w>-') -- make split window height shorter
map('n', '<leader>sk', '<C-w>+') -- make split windows height taller
map('n', '<leader>sl', '<C-w>>5') -- make split windows width bigger
map('n', '<leader>sh', '<C-w><5') -- make split windows width smaller

-- Tab management
map('n', '<leader>to', ':tabnew<CR>') -- open a new tab
map('n', '<leader>tx', ':tabclose<CR>') -- close a tab
map('n', '<leader>tn', ':tabn<CR>') -- next tab
map('n', '<leader>tp', ':tabp<CR>') -- previous tab
--
-- yank to clipboard
map({ 'n', 'v' }, '<leader>y', [["+y]])

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- black python formatting
map('n', '<leader>fmp', ':silent !black %<cr>')

-- Vertical scroll and center
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Diff keymaps
map('n', '<leader>cc', ':diffput<CR>') -- put diff from current to other during diff
map('n', '<leader>cj', ':diffget 1<CR>') -- get diff from left (local) during merge
map('n', '<leader>ck', ':diffget 3<CR>') -- get diff from right (remote) during merge
map('n', '<leader>cn', ']c') -- next diff hunk
map('n', '<leader>cp', '[c') -- previous diff hunk

-- Quickfix keymaps
map('n', '<leader>qo', ':copen<CR>') -- open quickfix list
map('n', '<leader>qf', ':cfirst<CR>') -- jump to first quickfix list item
map('n', '<leader>qn', ':cnext<CR>') -- jump to next quickfix list item
map('n', '<leader>qp', ':cprev<CR>') -- jump to prev quickfix list item
map('n', '<leader>ql', ':clast<CR>') -- jump to last quickfix list item
map('n', '<leader>qc', ':cclose<CR>') -- close quickfix list

-- Vim-maximizer
map('n', '<leader>sm', ':MaximizerToggle<CR>') -- toggle maximize tab

--- NOTE: nveim-tree keymaps
-- Nvim-tree
-- map('n', '<leader>ee', ':NvimTreeToggle<CR>') -- toggle V file explorer
-- map('n', '<leader>er', ':NvimTreeFocus<CR>') -- toggle focus to file explorer
-- map('n', '<leader>ef', ':NvimTreeFindFile<CR>') -- find file in file explorer
--- NOTE: you cau neotree instead of nvim-tree
--- Nvim-tree
map('n', '<leader>ee', ':Neotree toggle<CR>') -- toggle file explorer
map('n', '<leader>er', ':Neotree focus<CR>') -- toggle focus to file explorer
-- map('n', '<leader>ef', ':NvimTreeFindFile<CR>') -- find file in file explorer
--
-- Telescope:
-- keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
-- keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
-- keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
-- keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
-- keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})
-- keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
-- keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})
-- keymap.set('n', '<leader>fm', function()
-- require('telescope.builtin').treesitter { default_text = ':method:' }
-- end)

-- Git-blame
map('n', '<leader>gb', ':GitBlameToggle<CR>') -- toggle git blame

-- Harpoon
map('n', '<leader>ha', require('harpoon.mark').add_file)
map('n', '<leader>hh', require('harpoon.ui').toggle_quick_menu)
map('n', '<leader>h1', function()
  require('harpoon.ui').nav_file(1)
end)
map('n', '<leader>h2', function()
  require('harpoon.ui').nav_file(2)
end)
map('n', '<leader>h3', function()
  require('harpoon.ui').nav_file(3)
end)
map('n', '<leader>h4', function()
  require('harpoon.ui').nav_file(4)
end)
map('n', '<leader>h5', function()
  require('harpoon.ui').nav_file(5)
end)
map('n', '<leader>h6', function()
  require('harpoon.ui').nav_file(6)
end)
map('n', '<leader>h7', function()
  require('harpoon.ui').nav_file(7)
end)
map('n', '<leader>h8', function()
  require('harpoon.ui').nav_file(8)
end)
map('n', '<leader>h9', function()
  require('harpoon.ui').nav_file(9)
end)

-- Vim REST Console
map('n', '<leader>xr', ':call VrcQuery()<CR>') -- Run REST query

-- LSP
map('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
map('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
map('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

-- Debugging
map('n', '<leader>bb', "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
map('n', '<leader>bc', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
map('n', '<leader>bl', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
map('n', '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
map('n', '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
map('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>")
map('n', '<leader>dj', "<cmd>lua require'dap'.step_over()<cr>")
map('n', '<leader>dk', "<cmd>lua require'dap'.step_into()<cr>")
map('n', '<leader>do', "<cmd>lua require'dap'.step_out()<cr>")
map('n', '<leader>dd', function()
  require('dap').disconnect()
  require('dapui').close()
end)
map('n', '<leader>dt', function()
  require('dap').terminate()
  require('dapui').close()
end)
map('n', '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>")
map('n', '<leader>dl', "<cmd>lua require'dap'.run_last()<cr>")
map('n', '<leader>di', function()
  require('dap.ui.widgets').hover()
end)
map('n', '<leader>d?', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end)
map('n', '<leader>df', '<cmd>Telescope dap frames<cr>')
map('n', '<leader>dh', '<cmd>Telescope dap commands<cr>')
map('n', '<leader>de', function()
  require('telescope.builtin').diagnostics { default_text = ':E:' }
end)
