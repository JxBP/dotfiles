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

        local colors = {
            darker_black = "#141617",
            black = "#1d2021",
            black2 = "#282828",
            white = "#ddc7a1",
            red = "#ea6962",
            green = "#a9b665",
            yellow = "#d8a657"
        }
        hi("TelescopeBorder", { fg = colors.darker_black, bg = colors.darker_black, })
        hi("TelescopePromptBorder", { fg = colors.black2, bg = colors.black2, })
        hi("TelescopePromptNormal", { fg = colors.white, bg = colors.black2, })
        hi("TelescopePromptPrefix", { fg = colors.white, bg = colors.black2, })
        hi("TelescopeNormal", { bg = colors.darker_black })
        hi("TelescopePreviewTitle", { fg = colors.darker_black, bg = colors.darker_black, })
        hi("TelescopePromptTitle", { fg = colors.black2, bg = colors.black2, })
        hi("TelescopeResultsTitle", { fg = colors.darker_black, bg = colors.darker_black, })
        hi("TelescopeSelection", { bg = colors.black2, fg = colors.white })
        hi("TelescopeResultsDiffAdd", { fg = colors.green, })
        hi("TelescopeResultsDiffChange", { fg = colors.yellow, })
        hi("TelescopeResultsDiffDelete", { fg = colors.red, })

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
            vim.g.gruvbox_material_better_performance = 1
            color("gruvbox-material")()
        end
    },
}
