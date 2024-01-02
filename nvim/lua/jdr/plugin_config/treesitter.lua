local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", 'typescript', 'tsx', 'css',
        "bash",
        "c",
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
        "pug",
        "regex",
        "rust",
        "yaml",
    },
    highlight = { enable = true, use_languagetree = true },
    indent = { enable = true },
    rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
    sync_install = true,
    autopairs = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true },
})


require('nvim-ts-autotag').setup()
