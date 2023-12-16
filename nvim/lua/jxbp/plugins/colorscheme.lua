--- Returns a function that can be passed to lazy.nvim's config parameter to set
--- the desired colorscheme if set in vim.g.jxbp_colorscheme.
---@param colorscheme string
local apply_color = function(colorscheme)
    if vim.g.jxbp_colorscheme == colorscheme then
        vim.cmd("colorscheme " .. colorscheme)

        if vim.g.jxbp_transparent_bg then
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        end

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
            { border = "single" })
    end
end

return {
    {
        "sainnhe/gruvbox-material",
        pin = true,
        config = function()
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_diagnostic_line_highlight = 1
            vim.g.gruvbox_material_diagnostic_virtual_text = 1
            vim.g.gruvbox_material_float_style = "dim"
            apply_color("gruvbox-material")
        end
    },
}
