return {
    "folke/which-key.nvim",
    pin = true,
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = true,
}
