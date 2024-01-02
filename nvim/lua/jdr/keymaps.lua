vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.cmd([[
nnoremap <leader>w :w<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>v :vs<CR>

nnoremap <C-d> <C-d>zz 
nnoremap <C-u> <C-u>zz 
]])

