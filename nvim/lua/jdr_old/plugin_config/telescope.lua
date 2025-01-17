local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions
local telescopeTrouble = require("trouble.providers.telescope")

local open_with_trouble = require("trouble.sources.telescope").open

local function flash(prompt_bufnr)
    require("flash").jump({
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
            mode = "search",
            exclude = {
                function(win)
                    return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
                end,
            },
        },
        action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
        end,
    })
end

telescope.setup({
    defaults = {
        path_display = { "smart" },
        mappings = {
            n = { 
                ["s"] = flash,
                ["q"] = actions.close,
                ["<c-x>"] = open_with_trouble ,
            },
            i = { 
                ["<c-s>"] = flash,
                ["<Esc>"] = require("telescope.actions").close, -- don't go into normal mode, just close
                ["<C-j>"] = require("telescope.actions").move_selection_next, -- scroll the list with <c-j>
                ["<C-k>"] = require("telescope.actions").move_selection_previous, -- scroll the list with <c-k>
                ["<C-b>"] = actions.select_horizontal, -- open selection in new horizantal split
                ["<C-v>"] = actions.select_vertical, -- open selection in new vertical split
                ["<c-x>"] = open_with_trouble,
            }, 
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        --file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("git_worktree")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fG', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fC', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fc', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>fB', builtin.git_branches, {})
vim.keymap.set('n', '<leader>f:', builtin.commands, {})
vim.keymap.set("n", "<leader>gwt", telescope.extensions.git_worktree.git_worktrees, {})
vim.keymap.set("n", "<leader>gwa", telescope.extensions.git_worktree.git_worktrees, {})

