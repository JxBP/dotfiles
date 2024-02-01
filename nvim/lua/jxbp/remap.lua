--- Adds a mapping for normal mode
---@param key string
---@param command string|function
---@param desc string
---@param opts table|nil
local function nmap(key, command, desc, opts)
    vim.keymap.set("n", key, command, vim.tbl_extend("error", opts or {}, { desc = desc }))
end

nmap("<leader>pv", vim.cmd.Ex, "Open netrw")
nmap("<leader>lI", vim.cmd.LspInfo, "LSP Info")
nmap("<leader>U", vim.cmd.UndotreeToggle, "Toggle undo tree")
nmap("<leader>Cx", "!chmod u+x expand('%:p')", "Make executable")
nmap("<leader>bc", ":bdelete<CR>", "Close buffer")
nmap("<leader>Tn", ":tabnew<CR>", "Create a new tab")
nmap("<leader>Tc", ":tabclose<CR>", "Close the current tab")

-- https:stackoverflow.com/questions/4465095/how-to-delete-a-buffer-in-vim-without-losing-the-split-window
nmap("<leader>bk", ":bp|bd #<CR>", "Kill buffer (without closing its window)", { silent = true })
