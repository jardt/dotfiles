return { {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    version = false,
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "c",
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
                "git_rebase",
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
} }
