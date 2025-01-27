return { {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
},
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        enabled = true,
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
        opts = {
            ui = { enable = false },
            workspaces = {
                {
                    name = "notes",
                    path = "/Users/jardar.ton/notes",
                },
                -- {
                --     name = "master",
                --     path = "/Users/jardar/Library/Mobile Documents/iCloud~md~obsidian/Documents/master",
                -- },
                -- {
                --     name = "audit",
                --     path = "/Users/jardar/Library/Mobile Documents/iCloud~md~obsidian/Documents/audit",
                -- },
            },
            -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
            completion = {
                -- Set to false to disable completion.
                nvim_cmp = true,
                -- Trigger completion at 2 chars.
                min_chars = 2,
            },

            -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
            -- way then set 'mappings = {}'.
            mappings = {
                -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                ["gd"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                -- Toggle check-boxes.
                ["<leader>ch"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
                -- Smart action depending on context, either follow link or toggle checkbox.
                ["<cr>"] = {
                    action = function()
                        return require("obsidian").util.smart_action()
                    end,
                    opts = { buffer = true, expr = true },
                },
                -- Smart action depending on context, either follow link or toggle checkbox.
                ["<leader>N"] = {
                    action = function()
                        return '<cmd>ObsidianNew<cr>'
                    end,
                    opts = { buffer = true, expr = true },
                },
                ["<leader>fo"] = {
                    action = function()
                        return '<cmd>ObsidianOpen<cr>'
                    end,
                    opts = { buffer = true, expr = true },
                },
                ["<leader>fl"] = {
                    action = function()
                        return '<cmd>ObsidianLinks<cr>'
                    end,
                    opts = { buffer = true, expr = true },
                },
                ["<leader>gr"] = {
                    action = function()
                        return '<cmd>ObsidianBacklinks<cr>'
                    end,
                    opts = { buffer = true, expr = true },
                }

            },
        },
    } }
