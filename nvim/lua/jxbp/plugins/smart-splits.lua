return {
    {
        "mrjones2014/smart-splits.nvim",
        lazy = false,
        pin = true,
        keys = function()
            local ss = require("smart-splits")
            return {
                { "<C-M-h>",           ss.resize_left,       desc = "Resize left" },
                { "<C-M-j>",           ss.resize_down,       desc = "Resize down" },
                { "<C-M-k>",           ss.resize_up,         desc = "Resize up" },
                { "<C-M-l>",           ss.resize_right,      desc = "Resize right" },
                { "<M-h>",             ss.move_cursor_left,  desc = "Focus left" },
                { "<M-j>",             ss.move_cursor_down,  desc = "Focus bottom" },
                { "<M-k>",             ss.move_cursor_up,    desc = "Focus top" },
                { "<M-l>",             ss.move_cursor_right, desc = "Focus right" },
                { "<leader><leader>h", ss.swap_buf_left,     desc = "Swap buffer with left" },
                { "<leader><leader>j", ss.swap_buf_down,     desc = "Swap buffer with bottom" },
                { "<leader><leader>k", ss.swap_buf_up,       desc = "Swap buffer with top" },
                { "<leader><leader>l", ss.swap_buf_right,    desc = "Swap buffer with right" },
            }
        end
    },
}
