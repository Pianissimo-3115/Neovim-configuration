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

-- Syntax & filetype settings
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

vim.keymap.set("n", "<leader>vt", ":belowright split | resize 10 | terminal<CR>", { noremap = true, silent = true })

-- vim.keymap.set('n', '<C-/>', 'vgc', {})


vim.o.foldenable = true
vim.o.foldmethod = "indent" -- or "syntax"
vim.o.foldlevel = 99        -- keep all folds open by default

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.diagnostic.config({
    virtual_text = {
        prefix = "●", -- could also use ">>", "■", "●", etc.
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always", -- shows source (e.g. cppcheck)
        header = "",
        prefix = "",
    },
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})
