return { {
    {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local installed_lsp = { "lua_ls", "rust_analyzer", "ts_ls", "yamlls", "jsonls" }
            vim.lsp.inlay_hint.enable()
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    -- these will be buffer-local keybindings
                    -- because they only work if you have an active language server
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
                    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
                    vim.keymap.set("n", "gS", require("telescope.builtin").lsp_workspace_symbols, opts)
                    vim.keymap.set("n", "gs", require("telescope.builtin").lsp_document_symbols, opts)
                    vim.keymap.set("n", "gF", function()
                        require("telescope.builtin").lsp_workspace_symbols({ symbols = "functions" })
                    end, opts)
                    vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
                    vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions, opts)
                    vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>Wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>Wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>Wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", '<leader>i',
                        function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
                        end)
                    --vim.keymap.set("n", "<space>cA", vim.lsp.buf.range_code_action, opts)
                end
            })

            local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()
            -- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('mason-lspconfig').setup({
                ensure_installed = installed_lsp,
                handlers = {
                    function(server_name)
                        -- rustacians plugin handles rust lsp
                        if (server_name ~= 'rust_analyzer')
                        then
                            require('lspconfig')[server_name].setup({
                                capabilities = lsp_capabilities,
                            })
                        end
                    end,
                },
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
    },
    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {}, -- required, even if empty
    },
} }
