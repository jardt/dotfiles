return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "VeryLazy" },
        lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
        init = function(plugin)
            -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
            -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
           -- no longer trigger the **nvim-treesitter** module to be loaded in time.
            -- Luckily, the only things that those plugins need are the custom queries, which we make available
            -- during startup.
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
        end,
        opts_extend = { "ensure_installed" },
        ---@type TSConfig
        ---@diagnostic disable-next-line: missing-fields
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c",
                    "ron", --rust object notation
                    "lua",
                    "vim",
                    "vimdoc",
                    "javascript",
                    "html",
                    'typescript',
                    'tsx',
                    'css',
                    'c_sharp',
                    "bash",
                    "go",
                    "comment",
                    "css",
                    "diff",
                    "toml",
                    "git_rebase",
                    "vim",
                    "jsdoc",
                    "vimdoc",
                    "gitcommit",
                    "gitignore",
                    "jsdoc",
                    "json",
                    "json5",
                    "jsonc",
                    "markdown",
                    "markdown_inline",
                    "astro",
                    "pug",
                    "regex",
                    "rust",
                    "yaml",
                    "solidity",
                },
                highlight = { enable = true, use_languagetree = true },
                indent = { enable = true },
                rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
                sync_install = true,
                auto_install = true,
                autopairs = { enable = true },
                autotag = { enable = true },
                context_commentstring = { enable = true },
            })
        end
    }
}
