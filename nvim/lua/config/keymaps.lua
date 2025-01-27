vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.cmd([[
nnoremap <leader>w :w<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>v :vs<CR>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <leader>d :RustLsp renderDiagnostic cycle<CR>
nnoremap <leader>? :RustLsp explainError cycle<CR>
]])
