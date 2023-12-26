--- Adds a mapping for normal mode
---@param key string
---@param command string|function
---@param desc string
---@param opts table|nil
local function nmap(key, command, desc, opts)
    vim.keymap.set("n", key, command, vim.tbl_extend("error", opts or {}, { desc = desc }))
end

-------------
-- Luasnip --
-------------
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { desc = "LuaSnip forward", silent = true })
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { desc = "LuaSnip backward", silent = true })
vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { desc = "LuaSnip alternative", silent = true })

----------
-- Misc --
----------
nmap("<leader>pv", vim.cmd.Ex, "Open netrw")
nmap("<leader>lI", vim.cmd.LspInfo, "LSP Info")
nmap("<leader>U", vim.cmd.UndotreeToggle, "Toggle undo tree")


---------
-- DAP --
---------
local tdap = require("telescope").extensions.dap
nmap("<leader>dc", tdap.commands, "DAP commands")
nmap("<leader>dC", tdap.configurations, "DAP configurations")
nmap("<leader>dB", tdap.list_breakpoints, "DAP list breakpoints")
nmap("<leader>dv", tdap.variables, "DAP variables")
nmap("<leader>df", tdap.frames, "DAP frames")

local dap = require("dap")
nmap("<leader>db", dap.toggle_breakpoint, "DAP toggle breakpoint")
nmap("<leader>dn", dap.continue, "DAP toggle launch/continue")
nmap("<F5>", dap.continue, "DAP toggle launch/continue")
nmap('<F10>', dap.step_over, "DAP step over")
nmap('<F11>', dap.step_into, "DAP step into")
nmap('<F12>', dap.step_out, "DAP step out")
nmap("<leader>dr", dap.repl.open, "DAP open REPL")

nmap("<leader>dt", require("dapui").toggle, "Toggle DAP ui")

------------
-- Buffers -
------------
nmap("<leader>bc", ":bdelete<CR>", "Close buffer")

-- This is from
-- https:stackoverflow.com/questions/4465095/how-to-delete-a-buffer-in-vim-without-losing-the-split-window
nmap("<leader>bk", ":bp|bd #<CR>", "Kill buffer (without closing its window)", { silent = true })


---------
-- Tabs -
---------
nmap("<leader>Tn", ":tabnew<CR>", "Create a new tab")
nmap("<leader>Tc", ":tabclose<CR>", "Close the current tab")


--------------
-- Telescope -
--------------
local builtin = require("telescope.builtin")
nmap("<C-p>", builtin.find_files, "Find file")
nmap("<M-p>", builtin.buffers, "Find buffer")
nmap("<C-M-p>", builtin.git_files, "Find git file")
nmap("<C-f>", builtin.live_grep, "Live grep")
nmap("<leader>pg", builtin.live_grep, "Live grep")
nmap("<leader>pf", builtin.git_files, "Find git file")
nmap("<leader>bb", builtin.buffers, "View buffers")
nmap("<leader>ld", builtin.diagnostics, "View diagnostics")
-- nmap("<leader>vm", require("telescope").extensions.notify.notify, "View message history")


-----------------
-- smart-splits -
-----------------
local ss = require("smart-splits")
nmap("<C-M-h>", ss.resize_left, "Resize left")
nmap("<C-M-j>", ss.resize_down, "Resize down")
nmap("<C-M-k>", ss.resize_up, "Resize up")
nmap("<C-M-l>", ss.resize_right, "Resize right")

-- moving between splits
nmap("<M-h>", ss.move_cursor_left, "Focus left")
nmap("<M-j>", ss.move_cursor_down, "Focus bottom")
nmap("<M-k>", ss.move_cursor_up, "Focus top")
nmap("<M-l>", ss.move_cursor_right, "Focus right")

-- swapping buffers between windows
nmap("<leader><leader>h", ss.swap_buf_left, "Swap buffer with left")
nmap("<leader><leader>j", ss.swap_buf_down, "Swap buffer with bottom")
nmap("<leader><leader>k", ss.swap_buf_up, "Swap buffer with top")
nmap("<leader><leader>l", ss.swap_buf_right, "Swap buffer with right")
