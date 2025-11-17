return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rp}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            { 'saghen/blink.cmp' },
            { 'mfussenegger/nvim-jdtls' },
        },
        config = function(_, opts)
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            if not vim.g.vscode then
                capabilities = vim.tbl_deep_extend('force', capabilities,
                    require('blink.cmp').get_lsp_capabilities({}, false))
            end

            capabilities = vim.tbl_deep_extend('force', capabilities, {

                textDocument = {
                    sematicTokens = {
                        multiLineTokenSupport = true
                    },
                    completion = {
                        completionItem = {
                            snippetSupport = true
                        }
                    }
                }
            })

            vim.lsp.config('*', {
                capabilities = capabilities,
            })
            vim.lsp.config('ruff', {
                --init_options = {
                --    settings = {
                --        -- Ruff language server settings go here
                --    }
                --}
            })
            vim.lsp.config('basedpyright', {
                settings = {
                    basedpyright = {
                        disableOrganizeImports = true,
                        anaylsis = {
                            autoImportCompletions = true,

                            inlayHints = {
                                callArgumentNames = true
                            }
                        }
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { '*' },
                        },
                    },

                }
            })
            vim.lsp.config('jdtls', {
                settings = {
                    java = {
                        maven = {
                            downloadSources = true,
                        },
                        import = {
                            maven = {
                                enabled = true,
                            },
                            exclusions = {
                                "**/node_modules/**",
                                "**/.metadata/**",
                                "**/archetype-resources/**",
                                "**/META-INF/maven/**",
                                "/**/test/**"
                            }
                        },
                        referencesCodeLens = {
                            enabled = true
                        },
                        signatureHelp = {
                            enabled = true
                        },
                        implementationsCodeLens = {
                            enabled = true
                        },
                        format = {
                            enabled = true
                        },
                        saveActions = {
                            organizeImports = true
                        },
                        autobuild = {
                            enabled = true
                        },
                    },
                }

            })

            vim.lsp.enable({ 'lua_ls', 'basedpyright', 'ruff', 'ts_ls', 'terraformls', 'jdtls', 'gopls', 'rust_analyzer' })

            --vim.lsp.set_log_level('debug')

            vim.diagnostic.config({ virtual_text = true })

            vim.keymap.set("n", "<leader>dt", function()
                local config = vim.diagnostic.config() or {}
                if config.virtual_text then
                    vim.diagnostic.config { virtual_text = false, virtual_lines = false }
                else
                    vim.diagnostic.config { virtual_text = true, virtual_lines = false }
                end
            end, { desc = "Toggle lsp lines" })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('my.lsp', {}),
                callback = function(args)
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    if not client then return end


                    --client.offset_encoding = "utf-8"
                    vim.keymap.set("n", "<leader>dy", vim.diagnostic.setloclist,
                        { desc = "Yank diagnostic list for current buffer" })


                    ---- Find references for the word under your cursor.
                    vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references,
                        { buffer = 0, desc = 'LSP: [G]oto [R]eferences' })

                    ---- Jump to the implementation of the word under your cursor.
                    ----  Useful when your language has ways of declaring types without an actual implementation.
                    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations,
                        { buffer = 0, desc = 'LSP: [G]oto [I]mplementation' })

                    ---- Jump to the definition of the word under your cursor.
                    ----  This is where a variable was first declared, or where a function is defined, etc.
                    ----  To jump back, press <C-t>.
                    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions,
                        { buffer = 0, desc = 'LSP: [G]oto [D]efinition' })

                    ---- Fuzzy find all the symbols in your current document.
                    ----  Symbols are things like variables, functions, types, etc.
                    vim.keymap.set('n', '<leader>wd', require('telescope.builtin').lsp_document_symbols,
                        { buffer = 0, desc = 'LSP: Open Document Symbols' })



                    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
                    if client:supports_method('textDocument/completion') then
                        -- Optional: trigger autocompletion on EVERY keypress. May be slow!
                        -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
                        -- client.server_capabilities.completionProvider.triggerCharacters = chars

                        --vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
                    end

                    -- Auto-format ("lint") on save.
                    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
                    if not client:supports_method('textDocument/willSaveWaitUntil')
                        and client:supports_method('textDocument/formatting') then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                            buffer = args.buf,
                            callback = function()
                                print(client.name)
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end,
            })
        end,
    }
}
