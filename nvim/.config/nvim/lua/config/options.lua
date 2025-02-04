vim.opt.number = true
vim.opt.relativenumber = true

--- SPLITS
vim.opt.splitbelow = true    -- open splits below
vim.opt.splitright = true    -- open splits right

vim.opt.inccommand = "split" -- show subsition result in new split window


vim.opt.expandtab = true -- tabs instead of spaces
vim.opt.tabstop = 4      --- 4 spaces for tabs
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.virtualedit = 'block'

vim.opt.wrap = false -- disable linewraps


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.guicursor = ""
vim.opt.termguicolors = true -- use colors from term

vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "180"

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.g.border_style = "rounded"

vim.opt.clipboard = "unnamedplus" -- use system cliipboard

vim.opt.ignorecase = true         --comamnds ignore casing

-- swap and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
