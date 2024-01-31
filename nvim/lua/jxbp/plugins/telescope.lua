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
                -- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
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
    },
}
