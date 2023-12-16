local bufnr = vim.api.nvim_get_current_buf()

local map_rl = function(key, cmd, desc)
    vim.keymap.set("n", key, function()
        vim.cmd.RustLsp(cmd, {
            desc = desc,
            silent = true,
            buffer = bufnr,
        })
    end)
end

vim.g.rustaceanvim = {
    tools = {
        -- quickfix/termopen
        executor = "termopen",
        reload_workspace_from_cargo_toml = true,
        hover_actions = {
            replace_builtin_hover = false,
        },
    },
    server = {
        cmd = { vim.env.CARGO_HOME .. "/bin/ra-multiplex" },
        on_attach = function(bufnr_, client)
            map_rl("K", "hover action", "Hover action")
            map_rl("<leader>rt", "openCargo", "Open cargo.toml")
            map_rl("<leader>rP", "parent_module", "Goto parent module")
            map_rl("<leader>ru", "joinLines", "Join adjacent lines")

            -- Formato n save
            require("jxbp.plugins.lsp.formatting")(bufnr_, client)

            vim.lsp.inlay_hint.enable(bufnr, true)
        end,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    enable = true,
                    command = "clippy",
                },
                inlayHints = {
                    enable = true,
                    typeHints = true,
                    parameterHints = true,
                },
                callInfo = {
                    full = true,
                },
                lens = {
                    enable = true,
                    references = true,
                    implementations = true,
                    enumVariantReferences = true,
                    methodReferences = true,
                },
                cargo = {
                    autoreload = true,
                },
                hoverActions = {
                    enable = true,
                },
                procMacro = { enable = true },
            },
        },
    },
}

-- not working properly somehow
vim.cmd [[:TSDisable indent]]
