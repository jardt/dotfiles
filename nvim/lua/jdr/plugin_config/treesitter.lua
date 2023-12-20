local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", 'typescript', 'tsx', 'css' },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },  
	autopairs = { enable = true },
	rainbow = { enable = true },
	autotag = { enable = true },
	context_commentstring = { enable = true },
})

