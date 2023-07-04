local M = {}

M.setup = function()
	local lsp = require("lsp-zero")
	local mappings = require("jxbp.plugins.lsp.config.mappings")
	local navic = require("nvim-navic")

	lsp.preset("recommended")
	lsp.ensure_installed({ "rust_analyzer" })
	lsp.setup_nvim_cmp({ mapping = mappings.completions })
	lsp.set_preferences({ set_lsp_keymaps = false })
	lsp.nvim_workspace({ library = vim.api.nvim_get_runtime_file("", true) })
	lsp.on_attach(function(client, bufnr)
		mappings.general(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
	end)

	-- Mason's OCaml LSP is outdated unfortunately
	require("lspconfig").ocamllsp.setup({})

	-- rust tools
	lsp.skip_server_setup({ "rust_analyzer" })

	local rt = require("jxbp.plugins.lsp.config.rust_tools")
	local rt_config = lsp.build_options("rust_analyzer", {
		on_attach = rt.on_attach,
		settings = rt.settings,
	})

	lsp.setup()
	rt.setup(rt_config)

	-- This should be unnecessary with lspzero.nvim 2.x
	-- local null_ls_lsp = lsp.build_options("null-ls", {})
	require("jxbp.plugins.lsp.config.null-ls").setup()

	vim.diagnostic.config({
		virtual_text = true,
		signs = false,
	})
end

return M
