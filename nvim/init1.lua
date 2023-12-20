require("jdr")
vim.cmd([[set completeopt=menu,menuone,noselect

let mapleader=" "

nnoremap <leader>w :w<CR>
nnoremap <leader>ll :%!eslint --fix


"buffers
nnoremap <leader>w :w<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>l :BufferLineCycleNext<CR>
nnoremap <leader>h :BufferLineCyclePrev<CR>


nnoremap <silent><leader>gb :GitBlame<CR>
nnoremap <silent><leader><Esc> :call feedkeys("\<C-\><C-N>")
]])

vim.g.codeium_disable_bindings = 1

vim.g.border_style = "rounded"
vim.g.markdown_fenced_languages = {
	"bash=sh",
}
