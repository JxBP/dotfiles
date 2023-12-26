local M = {}

local mappings = require("jxbp.plugins.lsp.config.mappings")

local format_on_save = require("jxbp.plugins.lsp.formatting")

---@param server string
---@param opts table|nil
local lspconfig_setup = function(server, opts)
    local opts = opts or {}
    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(opts.capabilities or {})

    local config = vim.tbl_deep_extend("force", {
        capabilities = lsp_capabilities,
        on_attach = require("jxbp.plugins.lsp.formatting")
    }, opts or {})
    lspconfig[server].setup(config)
end

M.setup = function()
    require("neodev").setup({})

    local lsp_cmds = vim.api.nvim_create_augroup("lsp_attach", { clear = true })
    vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        group = lsp_cmds,
        callback = function(event)
            local id = vim.tbl_get(event, "data", "client_id")
            local client = {}

            if id then
                client = vim.lsp.get_client_by_id(id)
            end

            mappings.setup_lsp(client, event.buf)
        end,
    })

    local cmp = require("cmp")

    ---@diagnostic disable-next-line: missing-fields
    cmp.setup({
        ---@diagnostic disable-next-line: missing-fields
        window = {
            completion = {
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                border = 'none',
                scrollbar = false,
            },
            documentation = {
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                border = 'solid',
                scrollbar = false,
            },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert(mappings.cmp),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
        }),
        ---@diagnostic disable-next-line: missing-fields
        formatting = {
            format = function(_, vim_item)
                vim_item.kind = require("jxbp.plugins.lsp.config.kind_icons")[vim_item.kind] or "?"
                return vim_item
            end,
        },
    })

    vim.filetype.add({ extension = { templ = "templ" } })

    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
        ensure_installed = {
            "rust_analyzer",
            "taplo",
            "pyright",
        },
    })

    local handlers = {
        -- default
        function(server)
            lspconfig_setup(server, {})
        end,
        ["clangd"] = function()
            lspconfig_setup("clangd", {
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }, -- No proto(buf)
            })
        end,
        ["html"] = function()
            lspconfig_setup("html", {
                filetypes = { "html", "gohtmltmpl" }
            })
        end,
        ["rust_analyzer"] = function()
            -- Skip
        end,
        ["lua_ls"] = function()
            lspconfig_setup("lua_ls", {
                settings = {
                    Lua = {
                        telemetry = { enable = false },
                    },
                },
            })
        end,
        ["ocamllsp"] = function()
            lspconfig_setup("ocamllsp", {
                settings = {
                    codelens = {
                        enable = true
                    },
                    extendedHover = {
                        enable = true,
                    }
                },
                on_attach = function(client, bufnr)
                    format_on_save(client, bufnr)
                    -- require("virtualtypes").on_attach(client, bufnr)
                end
            })
        end,
        ["tailwindcss"] = function()
            lspconfig_setup("tailwindcss", {
                filetypes = { "html", "templ" },
                init_options = {
                    userLanguages = { templ = "html" }
                }
            })
        end,
        ["typst_lsp"] = function()
            lspconfig_setup("typst_lsp", {
                settings = {
                    exportPdf = "onType",
                },
            })
        end,
        ["zls"] = function()
            lspconfig_setup("zls", {
                on_attach = function(client, bufnr)
                    format_on_save(client, bufnr)
                    -- Semantic tokens flicker on save but the TreeSitter grammar has some issues too ;-(
                    -- This is a sad attempt at reducing the flickering by making TreeSitter have the same
                    -- colors that the semantic tokens have.
                    -- Unfortunately things like `=` don't work >.<

                    -- client.server_capabilities.semanticTokensProvider = nil
                    vim.cmd([[
                        hi! link @type.qualifier.zig Red
                        hi! link @attribute.zig Red
                        hi! link @lsp.type.operator.zig Orange
                    ]])
                end,
            })
        end,
    }
    mason_lspconfig.setup_handlers(handlers)

    vim.filetype.add({ extension = { typ = "typst" } })

    require("jxbp.plugins.lsp.config.null-ls").setup()

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
    })
end

return M
