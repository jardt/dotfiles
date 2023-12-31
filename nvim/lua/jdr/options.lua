vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
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

----- OLD STUFF -----
 -- vim.opt.backup = false -- creates a backup file
 -- vim.opt.clipboard = "" -- don't use clipboard
 -- vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
 -- vim.opt.colorcolumn = "99999" -- fixes indentline for now
 -- vim.opt.completeopt = { "menuone", "noselect" }
 -- vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
 -- vim.opt.cursorline = true -- highlight the current line
 -- vim.opt.expandtab = false -- convert tabs to spaces
 -- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
 -- vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
 -- vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
 -- vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
 -- vim.opt.hlsearch = true -- highlight all matches on previous search pattern
 -- vim.opt.ignorecase = true -- ignore case in search patterns
 -- vim.opt.list = true
 -- vim.opt.listchars = "tab:│ ,trail:·,nbsp:+"
 -- vim.opt.number = true -- set numbered lines
 -- vim.opt.numberwidth = 1 -- set number column width to 2 {default 4}
 -- vim.opt.pumheight = 10 -- pop up menu height
 -- vim.opt.relativenumber = false -- set relative numbered lines
 -- vim.opt.scrolloff = 4 -- is one of my fav
 -- vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
 -- vim.opt.sidescrolloff = 4
 -- vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
 -- vim.opt.smartcase = true -- smart case
 -- vim.opt.smartindent = true -- make indenting smarter again
 -- vim.opt.spell = false -- disable spell checking
 -- vim.opt.spelllang = "en" -- language for spell checking
 -- vim.opt.splitbelow = true -- force all horizontal splits to go below current window
 -- vim.opt.splitright = true -- force all vertical splits to go to the right of current window
 -- vim.opt.swapfile = false -- creates a swapfile
 -- vim.opt.tabstop = 2 -- insert 2 spaces for a tab
 -- vim.opt.timeoutlen = 500 -- timeout length
 -- vim.opt.title = true -- set the title of window to the value of the titlestring
 -- vim.opt.titlestring = "%<%F - nvim" -- what the title of the window will be set to
 -- vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
 -- vim.opt.undofile = true -- enable persistent undo
 -- vim.opt.updatetime = 300 -- faster completion
 -- vim.opt.wrap = false -- display lines as one long line
 -- vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
