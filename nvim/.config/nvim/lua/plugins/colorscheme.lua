return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1001,
		lazy = false,
		config = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			dim_inactive = { enabled = true, shade = "dark", percentage = 0.15 },
			transparent_background = true,
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
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
					style = "nvchad",
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				lsp_trouble = true,
				blink_cmp = true,
				gitsigns = true,
				markdown = true,
				ts_rainbow = true,
				fzf = true,
				mason = true,
				snacks = true,
				which_key = false,
			},
		},
		init = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
}
