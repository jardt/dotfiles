require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
        },
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        }
    },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'L3MON4D3/LuaSnip'},
    {"goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {"ThePrimeagen/harpoon"},
    {"lewis6991/gitsigns.nvim"},
    {"mbbill/undotree"},
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lua",
            "onsails/lspkind-nvim",
            {
                "ray-x/lsp_signature.nvim",
                event = "VeryLazy",
                opts = {},
                config = function(_, opts)
                    require("lsp_signature").setup(opts)
                end,
            },
        }
    },
    {
        "nvimdev/guard.nvim",
        -- Builtin configuration, optional
        dependencies = {
            "nvimdev/guard-collection",
        },
    },
    {"tpope/vim-fugitive"},
    {"sindrets/diffview.nvim"},
    {"nvim-lualine/lualine.nvim"},
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {"nvimdev/lspsaga.nvim"},
    {
        'tzachar/local-highlight.nvim',
    },
    {
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
    },
    { 'christoomey/vim-tmux-navigator'},
})
