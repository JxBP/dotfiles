local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                if vim.g.jxbp_format_on_save then
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        --[[
						filter = function(client)
							return client.name == "rust-analyzer" or client.name == "null-ls"
						end,
                        ]]
                        --
                    })
                end
            end,
        })
    end
end
