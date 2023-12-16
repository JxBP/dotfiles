return {
    "akinsho/flutter-tools.nvim",
    event = "BufReadPre *.dart",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim",
    },
    opts = {
        widget_guides = {
            enabled = true,
        },
    },
}
