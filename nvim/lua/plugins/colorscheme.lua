return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1001,
        lazy = false,
        config = {
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            dim_inactive = { enabled = true, shade = "dark", percentage = 0.15 },
            transparent_background = true,
            compile = { enabled = true, path = vim.fn.stdpath("cache") .. "/catppuccin", suffix = "_compiled" },
            no_italic = false,    -- Force no italic
            no_bold = false,      -- Force no bold
            no_underline = false, -- Force no underline
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = { "bold" },
                keywords = { "bold" },
                strings = { "italic" },
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            default_integrations = true,
            integrations = {
                harpoon = true,
                diffview = true,
                treesitter = true,
                telescope = {
                    enabled = true,
                    style = "nvchad"
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                },
                lsp_trouble = true,
                cmp = true,
                gitsigns = true,
                markdown = true,
                ts_rainbow = true,
            },
        },
        init = function()
            vim.cmd [[colorscheme catppuccin-macchiato]]
        end,
    }
}
