vim.keymap.set("n", "<leader>cr", function()
	vim.cmd.RustLsp("codeAction")
end, { desc = "Code Action rust" })

vim.keymap.set("n", "<leader>w", function()
	vim.cmd(":w")
end, { desc = "write file" })

vim.keymap.set("n", "<leader>d", function()
	vim.cmd(":bd")
end, { desc = "buffer close" })

vim.keymap.set("n", "<leader>a", function()
	vim.cmd(":b#")
end, { desc = "alernate file" })

vim.keymap.set("n", "<leader>v", function()
	vim.cmd(":vs")
end, { desc = "vertical split" })

vim.keymap.set("n", "<leader>rd", function()
	vim.cmd(":RustLsp renderDiagnostic current")
end, { desc = "rust diagnostic" })

vim.keymap.set("n", "<leader>rh", function()
	vim.cmd(":RustLsp explainError current")
end, { desc = "rust explainError" })

vim.keymap.set("n", "<leader>rD", function()
	vim.cmd(":RustLsp renderDiagnostic current")
end, { desc = "rust diagnostic" })

vim.keymap.set("n", "<leader>rH", function()
	vim.cmd(":RustLsp explainError cycle")
end, { desc = "rust explainError" })

vim.cmd([[
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
]])
