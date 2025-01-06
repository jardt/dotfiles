require("mason").setup()
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})


local attach_opts = { silent = true, buffer = bufnr }

vim.keymap.set("n", "K", vim.lsp.buf.hover, attach_opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, attach_opts)
vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, attach_opts)
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, attach_opts)
vim.keymap.set("n", "gS", require("telescope.builtin").lsp_workspace_symbols, attach_opts)
vim.keymap.set("n", "gs", require("telescope.builtin").lsp_document_symbols, attach_opts)
vim.keymap.set("n", "gF", function()
	require("telescope.builtin").lsp_workspace_symbols({ symbols = "functions" })
end, attach_opts)
vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, attach_opts)
vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions, attach_opts)
vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, attach_opts)
vim.keymap.set("n", "<space>Wa", vim.lsp.buf.add_workspace_folder, attach_opts)
vim.keymap.set("n", "<space>Wr", vim.lsp.buf.remove_workspace_folder, attach_opts)
vim.keymap.set("n", "<space>Wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, attach_opts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, attach_opts)
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, attach_opts)
--vim.keymap.set("n", "<space>cA", vim.lsp.buf.range_code_action, attach_opts)
