local M = {}

M.setup = function(server_opts)
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local lsp_formatting = function(bufnr)
		if vim.g.format_on_save then
			vim.lsp.buf.format({
				bufnr = bufnr,
				filter = function(client)
					return client.name == "rust_analyzer" or client.name == "null-ls"
				end,
			})
		end
	end

	local on_attach = function(client, bufnr)
		-- server_opts.on_attach(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end
	null_ls.setup({
		on_attach = on_attach,
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.clang_format,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.rustfmt,
			null_ls.builtins.formatting.perltidy,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.taplo,
			null_ls.builtins.formatting.gofmt,
			null_ls.builtins.formatting.zigfmt,
		},
	})
end

return M
