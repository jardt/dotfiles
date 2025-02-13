vim.keymap.set("n", "<leader>cr", function()
	vim.cmd.RustLsp("codeAction")
end, { desc = "Code Action rust" })

vim.keymap.set("n", "<leader>p", function()
	vim.cmd(':normal "0p')
end, { desc = "Code Action rust" })

vim.keymap.set("n", "<leader>w", function()
	vim.cmd(":w")
end, { desc = "write file" })

vim.keymap.set("n", "<leader>dd", function()
	vim.cmd(":bd")
end, { desc = "buffer close" })

vim.keymap.set("n", "<leader>a", function()
	vim.cmd(":b#")
end, { desc = "alernate file" })

vim.keymap.set("n", "<leader>v", function()
	vim.cmd(":vs")
end, { desc = "vertical split" })

vim.keymap.set("n", "<leader>re", function()
	vim.cmd(":RustLsp renderDiagnostic current")
end, { desc = "rust diagnostic" })

vim.keymap.set("n", "<leader>rr", function()
	vim.cmd(":RustLsp relatedDiagnostics")
end, { desc = "rust related diagnostic" })

vim.keymap.set("n", "<leader>rE", function()
	vim.cmd(":RustLsp renderDiagnostic cycle")
end, { desc = "rust diagnostic" })

vim.keymap.set("n", "<leader>rh", function()
	vim.cmd(":RustLsp explainError current")
end, { desc = "rust explainError" })

vim.keymap.set("n", "<leader>rH", function()
	vim.cmd(":RustLsp explainError cycle")
end, { desc = "rust explainError" })

vim.keymap.set("n", "<leader>rt", function()
	vim.cmd(":RustLsp testables ")
end, { desc = "rust run tests" })

vim.keymap.set("n", "<leader>rD", function()
	vim.cmd(":RustLsp debuggables")
end, { desc = "rust run debug" })

vim.keymap.set("n", "<leader>ro", function()
	vim.cmd(":RustLsp openDocs")
end, { desc = "rust open docs" })

vim.cmd([[
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
]])
