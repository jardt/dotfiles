return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = function()
            local trouble = require("trouble")
            local symbols = trouble.statusline({
                mode = "lsp_document_symbols",
                groups = {},
                title = false,
                filter = { range = true },
                format = "{kind_icon}{symbol.name:Normal}",
                -- The following line is needed to fix the background color
                -- Set it to the lualine section you want to use
                hl_group = "lualine_c_normal",
            })
            return {
                options = {
                    icons_enabled = true,
                    theme = 'catppuccin',
                },
                sections = {
                    lualine_c = {
                        {
                            symbols.get,
                            cond = symbols.has,
                        }
                    },
                    lualine_x = {
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            color = { fg = "#ff9e64" },
                        }
                    }
                },
            }
        end
    }
}


--        end,
