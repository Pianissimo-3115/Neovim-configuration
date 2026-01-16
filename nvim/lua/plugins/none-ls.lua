return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- C/C++
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.cppcheck,

                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
            },
        })

        -- Format helper (LSP format + re-indent whole buffer, keep cursor)
        vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({ async = false })
            local cursor = vim.api.nvim_win_get_cursor(0)
            vim.cmd("normal! ggVG=")
            vim.api.nvim_win_set_cursor(0, cursor)
        end, { noremap = true, silent = true, desc = "Format file with null-ls" })
    end,
}
