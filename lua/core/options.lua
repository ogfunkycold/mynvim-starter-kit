-- [[ Global Setting options ]]
-- See `:help vim.g`
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

local opt = vim.opt

-- Make line numbers default
opt.number = true -- Make line numbers default (default: false)

-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
opt.relativenumber = true -- Set relative numbered lines (default: false)

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a' -- Enable mouse mode (default: '')

-- Don't show the mode, since it's already in the status line
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  -- opt.clipboard = 'unnamedplus'
  opt.clipboard:append 'unnamedplus' -- Sync clipboard between OS and Neovim. (default: '')
end)

-- Enable break indent
opt.breakindent = true -- Enable break indent (default: false)

-- Save undo history
opt.undofile = true -- Save undo history (default: false)

-- Search Settings
-- NOTE:gn Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
opt.smartcase = true -- Smart case (default: false)

-- Appearance
opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
opt.background = 'dark'

-- Keep signcolumn on by default
opt.signcolumn = 'yes'
vim.diagnostic.config {
  float = { border = 'rounded' }, -- add border to diagnostic popups
}

-- Decrease update time
opt.updatetime = 250 -- Decrease update time (default: 4000)

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)

-- Split Windows
-- NOTE: Configure how new splits should be opened
opt.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
opt.splitright = true -- Force all vertical splits to go to the right of current window (default: false)

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Cursor Line
-- NOTE: Show which line your cursor is on
opt.cursorline = true -- Highlight the current line (default: false)

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
opt.sidescrolloff = 10 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)

-- Session Management
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Tabs & Indentatio
opt.tabstop = 4 -- Insert n spaces for a tab (default: 8)
vim.bo.softtabstop = 4
opt.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
opt.expandtab = true -- Convert tabs to spaces (default: false)
opt.autoindent = true -- Copy indent from current line when starting new one (default: true)

-- Line Wrapping
opt.wrap = false -- Display lines as one long line (default: true)
opt.linebreak = true -- Companion to wrap, don't split words (default: false)

-- Backspace
opt.backspace = 'indent,eol,start' -- Allow backspace on (default: 'indent,eol,start')

-- Consider - as part of keyword
opt.iskeyword:append '-'

-- Folding
opt.foldlevel = 20
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Utilize Treesitter folds
opt.showtabline = 2 -- Always show tabs (default: 1)

-- NOTE: from hvim
opt.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
opt.numberwidth = 4 -- Set number column width to 2 {default 4} (default: 4)
opt.swapfile = false -- Creates a swapfile (default: true)
opt.smartindent = true -- Make indenting smarter again (default: false)
opt.pumheight = 10 -- Pop up menu height (default: 0)
opt.conceallevel = 2 -- So that `` is visible in markdown files (default: 1)
-- opt.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
-- opt.modifiable = true -- Allow file to be modified (default: false)
-- opt.backup = false -- Creates a backup file (default: false)
opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
-- opt.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages (default: does not include 'c')
opt.iskeyword:append '-' -- Hyphenated words recognized by searches (default: does not include '-')
opt.formatoptions:remove { 'c', 'r', 'o' } -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
--
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default (default: 'auto')
--
--
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
