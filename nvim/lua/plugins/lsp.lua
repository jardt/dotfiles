return {
	{
		{
			"williamboman/mason.nvim",
			dependencies = {
				{ "williamboman/mason-lspconfig.nvim", config = function() end },
			},
			opts_extend = { "ensure_installed" },
			opts = {
				ensure_installed = {
					"stylua",
					"shfmt",
					"marksman",
					"ts_ls",
					"rust_analyser",
					"json_ls",
					"html",
					"cssls",
					"lua_ls",
					"tailwindcss",
					"yamlls",
					"luacheck",
				},
			},
		},
		{
			"neovim/nvim-lspconfig",
			opts = function()
				---@class PluginLspOpts
				local ret = {
					-- options for vim.diagnostic.config()
					---@type vim.diagnostic.Opts
					diagnostics = {
						underline = true,
						update_in_insert = false,
						virtual_text = {
							spacing = 4,
							source = "if_many",
							prefix = "●",
							-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
							-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
							-- prefix = "icons",
						},
						severity_sort = true,
					},
					inlay_hints = {
						enabled = true,
						exclude = {}, -- filetypes for which you don't want to enable inlay hints
					},
					codelens = {
						enabled = true,
					},
					capabilities = {
						workspace = {
							fileOperations = {
								didRename = true,
								willRename = true,
							},
						},
					},
					-- LSP Server Settings
					---@type lspconfig.options
					servers = {
						lua_ls = {
							-- mason = false, -- set to false if you don't want this server to be installed with mason
							-- Use this to add any additional keymaps
							-- for specific lsp servers
							-- ---@type LazyKeysSpec[]
							-- keys = {},
							settings = {
								Lua = {
									workspace = {
										checkThirdParty = false,
									},
									codeLens = {
										enable = true,
									},
									completion = {
										callSnippet = "Replace",
									},
									doc = {
										privateName = { "^_" },
									},
									hint = {
										enable = true,
										setType = false,
										paramType = true,
										paramName = "Disable",
										semicolon = "Disable",
										arrayIndex = "Disable",
									},
								},
							},
						},
					},
					-- you can do any additional lsp server setup here
					-- return true if you don't want this server to be setup with lspconfig
					---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
					setup = {
						-- example to setup with typescript.nvim
						-- tsserver = function(_, opts)
						--   require("typescript").setup({ server = opts })
						--   return true
						-- end,
						-- Specify * to use this function as a fallback for any server
						-- ["*"] = function(server, opts) end,
					},
				}
				return ret
			end,
			config = function(_, opts)
				local installed_lsp = opts.servers
				vim.lsp.inlay_hint.enable()
				vim.api.nvim_create_autocmd("LspAttach", {
					desc = "LSP actions",
					callback = function(event)
						local opts = { buffer = event.buf }

						-- these will be buffer-local keybindings
						-- because they only work if you have an active language server
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
						--  { "gI", "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>", desc = "Goto Implementation" },
						--  { "gy", "<cmd>FzfLua lsp_typedefs        jump_to_single_result=true ignore_current_line=true<cr>", desc = "Goto T[y]pe Definition" },
						vim.keymap.set(
							"n",
							"gd",
							"<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>",
							opts
						)
						vim.keymap.set(
							"n",
							"gr",
							"<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<cr>",
							opts
						)
						vim.keymap.set(
							"n",
							"gI",
							"<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>",
							opts
						)
						vim.keymap.set(
							"n",
							"gt",
							"<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<cr>",
							opts
						)
						vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
						vim.keymap.set("n", "<space>Wa", vim.lsp.buf.add_workspace_folder, opts)
						vim.keymap.set("n", "<space>Wr", vim.lsp.buf.remove_workspace_folder, opts)
						vim.keymap.set("n", "<space>ca", function()
							require("fzf-lua").lsp_code_actions({
								winopts = {
									relative = "cursor",
									width = 0.6,
									height = 0.6,
									row = 1,
									preview = { vertical = "up:70%" },
								},
							})
						end, opts)
						vim.keymap.set("n", "<space>Wl", function()
							print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
						end, opts)
						vim.keymap.set("n", "<leader>i", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
						end, { desc = "toggle inlay hints" })
					end,
				})

				local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()
				require("mason-lspconfig").setup({
					ensure_installed = installed_lsp,
					handlers = {
						function(server_name)
							-- rustacians plugin handles rust lsp
							if server_name ~= "rust_analyzer" then
								require("lspconfig")[server_name].setup({
									capabilities = lsp_capabilities,
								})
							end
						end,
					},
				})
			end,
		},
		{
			"chrisgrieser/nvim-lsp-endhints",
			event = "LspAttach",
			opts = {}, -- required, even if empty
		},
	},
}
