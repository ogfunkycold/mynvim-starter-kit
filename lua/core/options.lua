-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

local opt = vim.opt

-- Session Management
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Line Numbers
opt.relativenumber = true -- Set relative numbered lines (default: false)
opt.number = true -- Make line numbers default (default: false)

-- Tabs & Indentatio
opt.tabstop = 2 -- Insert n spaces for a tab (default: 8)
vim.bo.softtabstop = 2
opt.shiftwidth = 2 -- The number of spaces inserted for each indentation (default: 8)
opt.expandtab = true -- Convert tabs to spaces (default: false)
opt.autoindent = true -- Copy indent from current line when starting new one (default: true)

-- Line Wrapping
opt.wrap = false -- Display lines as one long line (default: true)
opt.linebreak = true -- Companion to wrap, don't split words (default: false)

-- Search Settings
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
opt.smartcase = true -- Smart case (default: false)

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'
vim.diagnostic.config {
  float = { border = 'rounded' }, -- add border to diagnostic popups
}

-- Backspace
opt.backspace = 'indent,eol,start'

-- Clipboard
opt.clipboard:append 'unnamedplus'

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append '-'

-- Disable the mouse while in nvim
opt.mouse = 'a' -- Enable mouse mode (default: '')

-- Folding
opt.foldlevel = 20
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Utilize Treesitter folds

opt.showtabline = 2 -- Always show tabs (default: 1)
