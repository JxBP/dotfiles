-- https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
vim.cmd [[TSDisable indent]]
vim.keymap.set("n", "<leader>F", require("telescope").extensions.flutter.commands, { desc = "Flutter commands" })
