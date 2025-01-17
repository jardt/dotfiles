return { {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-emoji",
        "zbirenbaum/copilot-cmp",
        "onsails/lspkind-nvim",
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function()
        local lspkind = require("lspkind")
        local cmp = require("cmp")
        local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter

        vim.o.completeopt = "menu,menuone,noselect"

        return {
            ghost_text = { enabled = true },
            mapping = {
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-l>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "buffer",  keyword_length = 5, max_item_count = 5 },
                { name = "path" },
                { name = 'nerdfont' }
            }),
            formatting = {
                fields = { cmp.ItemField.Menu, cmp.ItemField.Abbr, cmp.ItemField.Kind },
                format = lspkind.cmp_format({
                    with_text = false,
                    -- menu = {
                    --     nvim_lsp = "ﲳ",
                    --     nvim_lua = "",
                    --     path = "ﱮ",
                    --     buffer = "﬘",
                    --     vsnip = "",
                    --     -- treesitter = "",
                    --     -- zsh = "",
                    --     -- spell = "暈"
                    -- },
                    --before = tailwind_formatter,
                    before = function(entry, vim_item)
                        -- ...
                        return vim_item
                    end,
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                }),
            },
            experimental = { native_menu = false, ghost_text = { enabled = true } },
        }
    end
} }
