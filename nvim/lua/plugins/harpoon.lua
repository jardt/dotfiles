return {
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("telescope").load_extension('harpoon')


            local harpoon = require("harpoon")
            harpoon.setup({})

            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>m", mark.add_file)
            vim.keymap.set("n", "<leader>fh", ui.toggle_quick_menu)

            vim.keymap.set("n", "<leader>hh", function() ui.nav_prev() end)
            vim.keymap.set("n", "<leader>hl", function() ui.nav_next() end)
            vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
            vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
        end
    },

}
