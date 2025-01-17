return { {
    "nvimdev/lspsaga.nvim",
    config = function()
        require("lspsaga").setup({})

        vim.cmd([[
        nnoremap <silent> gf :Lspsaga finder<CR>
        nnoremap <silent><leader>. :Lspsaga code_action<CR>
        nnoremap <silent><leader>t :Lspsaga peek_type_definition<CR>
        nnoremap <silent><leader>k :Lspsaga peek_definition<CR>
        nnoremap <silent> gs :Lspsaga signature_help<CR>
        nnoremap <silent>gR :Lspsaga rename<CR>
        ]])
    end
} }
