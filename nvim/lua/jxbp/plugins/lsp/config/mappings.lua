local M = {}

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- Completions
M.cmp = {
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-j>"] = cmp.mapping.confirm({ select = true }),
    ["<TAB>"] = cmp.mapping.confirm({ select = true }),
    ["<C-space>"] = cmp.mapping.complete(),
}

M.setup_lsp = function(_, bufnr)
    local opts = function(d)
        return { buffer = bufnr, remap = false, desc = d }
    end

    local telescope = require("telescope.builtin")
    require("which-key").register({
        ["<leader>l"] = { name = "LSP" },
        ["<leader>lw"] = { name = "Workspace" },
    })

    vim.keymap.set("n", "gd", telescope.lsp_definitions, opts("Goto definition"))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Goto declaration"))
    vim.keymap.set("n", "go", telescope.lsp_type_definitions, opts("Goto type def"))
    vim.keymap.set("n", "gi", telescope.lsp_implementations, opts("Goto implementations"))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
    vim.keymap.set("n", "<leader>lws", telescope.lsp_dynamic_workspace_symbols, opts("Workspace symbols"))
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts("Diagnostics Float"))
    vim.keymap.set("n", "<leader>lwd", telescope.diagnostics, opts("Workspace diagnostics"))
    vim.keymap.set("n", "<leader>ld", function()
        telescope.diagnostics({ bufnr = 0 })
    end, opts("Document diagnostics"))
    vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, opts("Next diagnostic"))
    vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, opts("Prev diagnostic"))
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts("Code action"))
    vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format()
    end, opts("Format"))
    vim.keymap.set("n", "gr", telescope.lsp_references, opts("References"))
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts("Rename"))
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts("Signature help"))
end

return M
