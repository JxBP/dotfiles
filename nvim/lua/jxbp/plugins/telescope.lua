return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.15",
        lazy = true,
        pin = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-dap.nvim",
        },
        opts = {
            defaults = {
                borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        mirror = true,
                        prompt_position = "top",
                        width = { padding = 12 },
                        height = { padding = 4 },
                        preview_width = 0.5,
                    },
                },
            },
        },
        keys = function()
            local builtin = require("telescope.builtin")
            return {
                { "<C-p>",      builtin.find_files,  desc = "Find file" },
                { "<M-p>",      builtin.buffers,     desc = "Find buffer" },
                { "<C-M-p>",    builtin.git_files,   desc = "Find git file" },
                { "<C-f>",      builtin.live_grep,   desc = "Live grep" },
                { "<leader>pg", builtin.live_grep,   desc = "Live grep" },
                { "<leader>pf", builtin.git_files,   desc = "Find git file" },
                { "<leader>bb", builtin.buffers,     desc = "View buffers" },
                { "<leader>ld", builtin.diagnostics, desc = "View diagnostics" },
            }
        end
    },
}
