return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = true,
        pin = true
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^3",
        ft = { "rust" },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },

            -- Autocompletion
            {
                "hrsh7th/nvim-cmp",
                event = "InsertEnter",
                dependencies = {
                    { "hrsh7th/cmp-buffer" },
                    { "hrsh7th/cmp-path" },
                    { "hrsh7th/cmp-nvim-lsp" },
                    { "hrsh7th/cmp-nvim-lua" },
                }
            },
        },
        config = function()
            require("jxbp.plugins.lsp.config").setup()
            --[[
            require("jxbp.plugins.lsp.lsp_lines").setup()
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = {
                    only_current_line = true,
                    highlight_whole_line = false,
                },
            })
            ]]
            --
        end
    },
}
