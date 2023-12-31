return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				file_browser = {
					-- disables netrw and use telescope-file-browser in its place
					--theme = "dropdown",
					winblend = 0,
					width = 0.75,
					preview_cutoff = 120,
					results_height = 1,
					results_width = 0.8,
					shorten_path = true,
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["i"] = {},
						["n"] = {
							-- your custom normal mode mappings
							["a"] = fb_actions.create,
							["d"] = fb_actions.remove,
							["r"] = fb_actions.rename,
							["y"] = fb_actions.copy,
							["m"] = fb_actions.move,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
			},
		})
		telescope.load_extension("file_browser")
		telescope.load_extension("fzf")
	end,
}
