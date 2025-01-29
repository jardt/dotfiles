return {
    {
        "nvimdev/guard.nvim",
        -- Builtin configuration, optional
        dependencies = {
            "nvimdev/guard-collection",
        },
        config = function()
            local ft = require("guard.filetype")

            -- Assuming you have guard-collection

            -- jft('typescriptreact,javascript,typescript'):lint("eslint_d"):fmt('prettier')
            ft('typescript,javascript,typescriptreact'):fmt('prettier'):lint('eslint_d')
            ft('rust'):fmt('rustfmt')
            -- Call setup() LAST!

            vim.g.guard_config = {
                -- format on write to buffer
                fmt_on_save = true,
                -- use lsp if no formatter was defined for this filetype
                lsp_as_default_formatter = true,
                -- whether or not to save the buffer after formatting
                save_on_fmt = true,
                -- automatic linting
                -- auto_lint = true,
                -- how frequently can linters be called
                lint_interval = 500
            }
        end
    },
}
