-- ~/.config/nvim/lua/vim-options.lua

-- Set indentation preferences
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4      -- Number of spaces for a tab
vim.opt.softtabstop = 4  -- Number of spaces when pressing Tab
vim.opt.shiftwidth = 4   -- Number of spaces for indentation

vim.opt.backspace = "indent,eol,start"

-- Search settings
vim.opt.hlsearch = true  -- Highlight search matches
vim.opt.incsearch = true -- Show incremental search matches

vim.o.updatetime = 300   -- or 200 for even faster
-- Indentation settings
vim.opt.autoindent = true
vim.opt.smartindent = true

-- UI settings
vim.opt.ruler = true              -- Show cursor position
vim.opt.number = true             -- Show line numbers
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.wrap = false
vim.o.guifont = "JetBrains Mono:h12"

-- Syntax & filetype settings
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Your custom keymap for a terminal
vim.keymap.set("n", "<leader>vt", ":belowright split | resize 10 | terminal<CR>", { noremap = true, silent = true })

vim.o.foldenable = true
vim.o.foldmethod = "indent" -- or "syntax"
vim.o.foldlevel = 99        -- keep all folds open by default

-- Insert-mode Ctrl+Backspace mapping (works in your terminal)
vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true, silent = true })

