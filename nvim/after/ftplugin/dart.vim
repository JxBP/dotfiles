" https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
:TSDisable indent
lua <<EOF
vim.keymap.set("n", "<leader>F", require("telescope").extensions.flutter.commands, { desc = "Flutter commands" })
EOF
