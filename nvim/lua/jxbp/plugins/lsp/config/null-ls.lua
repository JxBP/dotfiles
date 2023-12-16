local M = {}

M.setup = function()
    local null_ls = require("null-ls")
    null_ls.setup({
        on_attach = require("jxbp.plugins.lsp.formatting"),
        sources = {
            -- null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.clang_format,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.dart_format,
            null_ls.builtins.formatting.perltidy,
            -- null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.taplo,
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.zigfmt,
            null_ls.builtins.formatting.ocamlformat,
            null_ls.builtins.formatting.mix,
            null_ls.builtins.formatting.latexindent,
            null_ls.builtins.formatting.xmllint,
        },
    })
end

return M
