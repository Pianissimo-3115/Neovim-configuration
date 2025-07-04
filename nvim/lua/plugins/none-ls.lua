return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,

                -- Formatting
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,

                -- Linting
                --                null_ls.builtins.diagnostics.clang_check,
                --                null_ls.builtins.diagnostics.clang_tidy,
                null_ls.builtins.diagnostics.cppcheck,
            },
        })
        vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format()
            local cursor = vim.api.nvim_win_get_cursor(0)
            vim.cmd("normal! ggVG=")
            vim.api.nvim_win_set_cursor(0, cursor)
        end, { noremap = true, silent = true })
    end,
}
