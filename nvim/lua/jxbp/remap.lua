vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })
vim.keymap.set("n", "<leader>Ps", vim.cmd.PackerSync, { desc = "PackerSync" })

-- vim.keymap.set("n", "<leader>T", vim.cmd.ToggleTerm, { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen mode" })
-- vim.keymap.set("n", "<leader>Zt", ":ZenMode<CR>Twilight<CR>", { desc = "Toggle twilight + Zen mode" })

-- DAP
vim.keymap.set("n", "<leader>dc", ":Telescope dap commands<CR>", { desc = "DAP commands" })
vim.keymap.set("n", "<leader>dC", ":Telescope dap configurations<CR>", { desc = "DAP configurations" })
vim.keymap.set("n", "<leader>dB", ":Telescope dap list_breakpoints<CR>", { desc = "DAP list breakpoints" })
vim.keymap.set("n", "<leader>dv", ":Telescope dap variables<CR>", { desc = "DAP variables" })
vim.keymap.set("n", "<leader>df", ":Telescope dap frames<CR>", { desc = "DAP frames" })
vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "DAP toggle breakpoint" })
vim.keymap.set("n", "<leader>dn", ":lua require('dap').continue()<CR>", { desc = "DAP toggle launch/continue" })
vim.keymap.set("n", "<F5>", ":lua require('dap').continue()<CR>", { desc = "DAP toggle launch/continue" })
vim.keymap.set("n", "<leader>dr", ":lua require('dap').repl.open()<CR>", { desc = "DAP open REPL" })
vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { desc = "Toggle DAP ui" })

-- Buffers
vim.keymap.set("n", "<leader>cb", ":bdelete<CR>", { desc = "Close buffer" })

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Create a new tab" })
vim.keymap.set("n", "<leader>ct", ":tabclose<CR>", { desc = "Close the current tab" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find file" })
vim.keymap.set("n", "<M-p>", builtin.buffers, { desc = "Find buffer" })
vim.keymap.set("n", "<C-M-p>", builtin.git_files, { desc = "Find git file" })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>pf", builtin.git_files, { desc = "Find git file" })
vim.keymap.set("n", "<leader>bg", builtin.buffers, { desc = "View buffers" })
