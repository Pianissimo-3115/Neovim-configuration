return {
    ----------------------------------------------------------------------
    -- 1. Mason
    ----------------------------------------------------------------------
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    ----------------------------------------------------------------------
    -- 2. Mason-LSPConfig
    ----------------------------------------------------------------------
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                -- Don't let Mason manage clangd and rust-analyzer - we'll use system versions
                ensure_installed = { "lua_ls" },
            })
        end,
    },

    ----------------------------------------------------------------------
    -- 3. nvim-lspconfig using vim.lsp.config
    ----------------------------------------------------------------------
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            ------------------------------------------------------------------
            -- on_attach with debug
            ------------------------------------------------------------------
            local on_attach = function(client, bufnr)
                print("[DEBUG] LSP attached for " .. client.name .. " on buffer " .. bufnr)
                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
                end

                map('n', 'gD', vim.lsp.buf.declaration, "Go to Declaration")
                map('n', 'gd', vim.lsp.buf.definition, "Go to Definition")
                map('n', 'K', vim.lsp.buf.hover, "Hover Documentation")
                map('n', '<C-k>', vim.lsp.buf.signature_help, "Signature Help")
                map('n', '<leader>rn', vim.lsp.buf.rename, "Rename Symbol")
                map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, "Code Action")
                map('n', '<leader>gi', vim.lsp.buf.implementation, "Go to Implementation")
                map('n', '<leader>gr', vim.lsp.buf.references, "Go to References")
            end

            ------------------------------------------------------------------
            -- Capabilities
            ------------------------------------------------------------------
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            ------------------------------------------------------------------
            -- clangd setup (using system clangd, not Mason's)
            ------------------------------------------------------------------
            vim.lsp.config.clangd = {
                cmd = {
                    "/usr/bin/clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                    "--query-driver=/usr/bin/g++-11,/usr/bin/gcc-11,/usr/bin/g++,/usr/bin/gcc,/usr/bin/c++",
                    "--all-scopes-completion",
                    "--suggest-missing-includes",
                    "--pch-storage=memory",
                },
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "c", "cpp", "objc", "objcpp" },
            }
            vim.lsp.enable("clangd")

            ------------------------------------------------------------------
            -- rust-analyzer setup (using system rust-analyzer from rustup)
            ------------------------------------------------------------------
            vim.lsp.config.rust_analyzer = {
                cmd = { "rust-analyzer" },
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            buildScripts = {
                                enable = true,
                            },
                        },
                        check = {
                            command = "clippy",
                            extraArgs = { "--all-targets" },
                        },
                        procMacro = {
                            enable = true,
                        },
                        diagnostics = {
                            enable = true,
                            experimental = {
                                enable = true,
                            },
                        },
                        inlayHints = {
                            bindingModeHints = {
                                enable = false,
                            },
                            chainingHints = {
                                enable = true,
                            },
                            closingBraceHints = {
                                minLines = 25,
                            },
                            closureReturnTypeHints = {
                                enable = "never",
                            },
                            lifetimeElisionHints = {
                                enable = "never",
                                useParameterNames = false,
                            },
                            maxLength = 25,
                            parameterHints = {
                                enable = true,
                            },
                            reborrowHints = {
                                enable = "never",
                            },
                            renderColons = true,
                            typeHints = {
                                enable = true,
                                hideClosureInitialization = false,
                                hideNamedConstructor = false,
                            },
                        },
                    },
                },
                filetypes = { "rust" },
            }
            vim.lsp.enable("rust_analyzer")

            ------------------------------------------------------------------
            -- lua_ls setup
            ------------------------------------------------------------------
            vim.lsp.config.lua_ls = {
                cmd = { "lua-language-server" },
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        },
                    },
                },
                filetypes = { "lua" },
            }
            vim.lsp.enable("lua_ls")

            ------------------------------------------------------------------
            -- Diagnostics config: virtual text + signs
            ------------------------------------------------------------------
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●",
                    spacing = 2,
                },
                signs = true,
                underline = true,
                update_in_insert = false,
            })
        end,
    },
}
