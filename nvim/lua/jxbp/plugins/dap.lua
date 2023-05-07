return {
    {
        "rcarriga/nvim-dap-ui",
        config = function()
           local dap, dapui = require("dap"), require("dapui")
           dapui.setup()

           dap.listeners.after.event_initialized["dapui_config"] = function()
           	dapui.open()
           end

           dap.listeners.before.event_terminated["dapui_config"] = function()
           	dapui.close()
           end

           dap.listeners.before.event_exited["dapui_config"] = function()
           	dapui.close()
           end
        end,
        dependencies = {
            "mfussenegger/nvim-dap",
            config = function()
                    local dap = require("dap")
                    dap.adapters.lldb = {
                    	type = "server",
                    	port = "${port}",
                    	executable = {
                    		command = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"),
                    		args = { "--port", "${port}" },
                    	},
                    }
                    dap.configurations.c = {
                    	{
                    		name = "Launch",
                    		type = "lldb",
                    		request = "launch",
                    		program = function()
                    			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    		end,
                    		cwd = "${workspaceFolder}",
                    		stopOnEntry = false,
                    		args = {},
                    	},
                    }
                    dap.configurations.cpp = dap.configurations.c
                    dap.adapters.delve = {
                    	type = "server",
                    	port = "${port}",
                    	executable = {
                    		command = "dlv",
                    		args = { "dap", "-l", "127.0.0.1:${port}" },
                    	},
                    }
                    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
                    dap.configurations.go = {
                    	{
                    		type = "delve",
                    		name = "Debug",
                    		request = "launch",
                    		program = "${file}",
                    	},
                    	{
                    		type = "delve",
                    		name = "Debug test", -- configuration for debugging test files
                    		request = "launch",
                    		mode = "test",
                    		program = "${file}",
                    	},
                    	-- works with go.mod packages and sub packages
                    	{
                    		type = "delve",
                    		name = "Debug test (go.mod)",
                    		request = "launch",
                    		mode = "test",
                    		program = "./${relativeFileDirname}",
                    	},
                    }
            end
        }
    }
}
