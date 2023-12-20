local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local fb_actions = require("telescope").extensions.file_browser.actions
local trouble = require("trouble.providers.telescope")

telescope.setup()
telescope.setup({
	defaults = {
		path_display = { "smart" },
		mappings = {
			n = {
				["q"] = actions.close,
                i = { ["<c-t>"] = trouble.open_with_trouble },
                n = { ["<c-t>"] = trouble.open_with_trouble },
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

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>fe', telescope.extensions.file_browser, {})
