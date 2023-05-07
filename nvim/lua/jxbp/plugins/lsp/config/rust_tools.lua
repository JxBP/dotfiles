local M = {}

M.on_attach = function(_, bufnr)
	local desc = function(d)
		return { buffer = bufnr, remap = false, desc = d }
	end

	vim.keymap.set("n", "<leader>rr", function()
		require("rust-tools").runnables.runnables()
	end, desc("List runnables"))
	vim.keymap.set("n", "K", function()
		require("rust-tools").hover_actions.hover_actions()
	end, desc("Hover"))
	vim.keymap.set("n", "<leader>rt", function()
		require("rust-tools").open_cargo_toml.open_cargo_toml()
	end, desc("Open cargo.toml"))
	vim.keymap.set("n", "<leader>ro", function()
		require("rust-tools").parent_module.parent_module()
	end, desc("Goto parent module"))
	vim.keymap.set("n", "<leader>ru", function()
		require("rust-tools").join_lines.join_lines()
	end, desc("Goto parent module"))
	vim.keymap.set("n", "<leader>rR", function()
		require("rust-tools").workspace_refresh.reload_workspace()
	end, desc("Reload cargo"))
end

M.settings = {
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
}

M.setup = function(server_opts)
	local rust_tools = require("rust-tools")

	local opts = {
		tools = {
			executor = require("rust-tools.executors").quickfix, -- can be quickfix or termopen
			reload_workspace_from_cargo_toml = true,
		},
		server = server_opts,
	}

	local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/")
	local vscode_path = vim.fn.expand("~/") .. ".vscode/extensions/vadimcn.vscode-lldb-1.8.1/"

	local path = ""
	local debugger_found = true
	if M.dir_exists(mason_path) then
		path = mason_path
	elseif M.dir_exists(vscode_path) then
		path = vscode_path
	else
		debugger_found = false
		vim.notify("please install codelldb using :Mason or via vscode", vim.log.levels.WARN)
	end

	if debugger_found then
		local codelldb_path = path .. "adapter/codelldb"
		local liblldb_path = path .. "lldb/lib/liblldb.so"

		if vim.fn.filereadable(codelldb_path) and vim.fn.filereadable(liblldb_path) then
			opts.dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
			}
		else
			vim.notify("please reinstall codellb, I cannot find liblldb or codelldb itself", vim.log.levels.WARN)
		end
	end
	rust_tools.setup(opts)
end

M.dir_exists = function(file)
	local ok, _, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok
end

return M
