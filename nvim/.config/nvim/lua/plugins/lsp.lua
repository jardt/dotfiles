return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						"bashls",
						"marksman",
						"jsonls",
						"yamlls",
						"taplo",
						"html",
						"cssls",
						"tailwindcss",
						"lua_ls",
						"rust_analyzer",
						"gopls",
						"solidity_ls_nomicfoundation",
						"vtsls",
						"svelte",
						"clangd",
					},
				},
				config = function(_, opts)
					require("mason").setup()
					require("mason-lspconfig").setup({
						ensure_installed = opts.ensure_installed,
						automatic_installation = true,
					})
				end,
				dependencies = { "williamboman/mason.nvim" },
			},
		},
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
				keys = {
					{ "K", mode = { "n" }, vim.lsp.buf.hover, desc = "Hover lsp" },
					{ "gD", mode = { "n" }, vim.lsp.buf.declaration(), desc = "Decleration lsp" },
					{ "L", mode = { "n" }, vim.lsp.buf.hover, desc = "Hover lsp" },
					--vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					--vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				},
				inlay_hints = {
					enabled = true,
					exclude = {}, -- filetypes for which you don't want to enable inlay hints
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
					bashls = {},
					marksman = {},
					jsonls = {},
					yamlls = {
						settings = {
							yaml = {
								keyOrdering = false,
							},
						},
					},
					taplo = {},
					html = { "svelte", "html", "typescriptreact", "javascriptreact " },
					cssls = {
						filetypes = { "svelte", "css", "typescriptreact", "javascriptreact " },
					},
					tailwindcss = {},
					lua_ls = {
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
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
					rust_analyzer = {
						enabled = false,
					},
					gopls = {
						filetypes = { "go", "gomod", "gowork", "gosum" },
						root_markers = { "go.work", "go.mod", ".git" },
					},
					solidity_ls_nomicfoundation = {},
					vtsls = {
						filetypes = {
							"javascript",
							"javascriptreact",
							"javascript.jsx",
							"typescript",
							"typescriptreact",
							"typescript.tsx",
						},
						settings = {
							complete_function_calls = true,
							vtsls = {
								enableMoveToFileCodeAction = true,
								autoUseWorkspaceTsdk = true,
								experimental = {
									maxInlayHintLength = 30,
									completion = {
										enableServerSideFuzzyMatch = true,
									},
								},
							},
							typescript = {
								updateImportsOnFileMove = { enabled = "always" },
								suggest = {
									completeFunctionCalls = true,
								},
								inlayHints = {
									enumMemberValues = { enabled = true },
									functionLikeReturnTypes = { enabled = true },
									parameterNames = { enabled = "literals" },
									parameterTypes = { enabled = true },
									propertyDeclarationTypes = { enabled = true },
									variableTypes = { enabled = false },
								},
							},
						},
					},
					svelte = {
						workspace = {
							didChangeWatchedFiles = vim.fn.has("nvim-0.10") == 0 and { dynamicRegistration = true },
						},
					},
					clangd = {},
				},
				setup = {},
			}
			return ret
		end,
		config = function(_, opts)
			-- add completion to servers
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

			for server, server_opts in pairs(opts.servers) do
				server_opts.capabilities =
					vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
				if server_opts.enabled ~= false then
					lspconfig[server].setup(server_opts)
				end
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }
					-- these will be buffer-local keybindings
					-- because they only work if you have an active language server
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions jump1 ignore_current_line=true<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references jump1 ignore_current_line=true<cr>", opts)
					vim.keymap.set(
						"n",
						"gI",
						"<cmd>FzfLua lsp_implementations jump1 ignore_current_line=true<cr>",
						opts
					)
					vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs jump1 ignore_current_line=true<cr>", opts)
					vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
					vim.keymap.set(
						"n",
						"<space>Wa",
						vim.lsp.buf.add_workspace_folder,
						{ desc = "add workspace folder", buffer = event.buf }
					)
					vim.keymap.set(
						"n",
						"<space>Wr",
						vim.lsp.buf.remove_workspace_folder,
						{ desc = "remove workspace folder", buffer = event.buf }
					)
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
					end, { desc = "List workspace folder", buffer = event.buf })
					vim.keymap.set("n", "<leader>i", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
					end, { desc = "toggle inlay hints" })
				end,
			})

			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
	{
		"chrisgrieser/nvim-lsp-endhints",
		event = "LspAttach",
		opts = {}, -- required, even if empty
	},
}
