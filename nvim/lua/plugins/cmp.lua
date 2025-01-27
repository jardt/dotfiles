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
                { name = "nvim_lsp_signature_help" },
                { name = 'render-markdown' },
                { name = "buffer",                 keyword_length = 5, max_item_count = 5 },
                { name = "path" },
                { name = 'nerdfont' }
            }),
            formatting = {
                fields = { cmp.ItemField.Menu, cmp.ItemField.Abbr, cmp.ItemField.Kind },
                format = function(entry, vim_item)
                    if vim.tbl_contains({ 'path' }, entry.source.name) then
                        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item()
                            .label)
                        if icon then
                            vim_item.kind = icon
                            vim_item.kind_hl_group = hl_group
                            return vim_item
                        end
                    end
                    return require('lspkind').cmp_format({
                        with_text = true,
                        show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                    })(entry, vim_item)
                end
            },


            --  format = lspkind.cmp_format({
            --      mode = "text_symbol",
            --      menu = ({
            --          buffer = "[Buffer]",
            --          nvim_lsp = "[LSP]",
            --          luasnip = "[LuaSnip]",
            --          nvim_lua = "[Lua]",
            --          latex_symbols = "[Latex]",
            --      }),
            --      with_text = true,
            --      -- menu = {
            --      --     nvim_lsp = "ﲳ",
            --      --     nvim_lua = "",
            --      --     path = "ﱮ",
            --      --     buffer = "﬘",
            --      --     vsnip = "",
            --      --     -- treesitter = "",
            --      --     -- zsh = "",
            --      --     -- spell = "暈"
            --      -- },
            --      --before = tailwind_formatter,
            --      before = function(entry, vim_item)
            --          -- ...
            --          return vim_item
            --      end,
            --  }),
            --  },
            experimental = { native_menu = false, ghost_text = { enabled = true } },
        }
    end
} }
