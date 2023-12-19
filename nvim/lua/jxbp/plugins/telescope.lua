return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.15",
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
                        prompt_position = "bottom",
                        width = { padding = 0 },
                        height = { padding = 0 },
                        preview_width = 0.7,
                    },
                },
            },
        },
    },
}
