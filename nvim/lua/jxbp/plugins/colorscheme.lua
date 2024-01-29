local function hi(name, val) vim.api.nvim_set_hl(0, name, val) end
local function color(colorscheme)
    return function()
        vim.o.background = "dark"
        vim.cmd("color " .. colorscheme)

        hi("VirtualTextError", { fg = "#ea6962", bg = "none" })
        hi("VirtualTextWarning", { fg = "#d8a657", bg = "none" })
        hi("VirtualTextInfo", { fg = "#7daea3", bg = "none" })
        hi("VirtualTextHint", { fg = "#a9b665", bg = "none" })
        hi("PmenuSel", { bg = "#282C34", fg = "none" })
        hi("Pmenu", { fg = "#d4be98", bg = "#040404" })
        hi("NormalFloat", { fg = "#d4be98", bg = "#040404" })
        hi("FloatBorder", { fg = "#d4be98", bg = "#040404" })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover,
            { border = "solid", }
        )
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            { border = "none" }
        )
    end
end

-- This is here to easily try out other colorschemes ;)
local colorscheme = "gruvbox-material"

return {
    {
        "sainnhe/gruvbox-material",
        lazy = colorscheme ~= "gruvbox-material",
        pin = true,
        config = function()
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_diagnostic_line_highlight = 1
            vim.g.gruvbox_material_diagnostic_virtual_text = 1
            vim.g.gruvbox_material_transparent_background = 1
            color("gruvbox-material")()
        end
    },
}
