return {
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        pin = true,
        keys = function()
            local dapui = require("dapui")
            return {
                { "<leader>dt", dapui.toggle, desc = "Toggle DAP ui" }
            }
        end,
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = dapui.open
            dap.listeners.before.event_terminated["dapui_config"] = dapui.close
            dap.listeners.before.event_exited["dapui_config"] = dapui.close
        end,
        dependencies = {
            "mfussenegger/nvim-dap",
            pin = true,
            keys = function()
                local dap = require("dap")
                local tdap = require("telescope").extensions.dap
                return {
                    { "<leader>db", dap.toggle_breakpoint, desc = "DAP toggle breakpoint" },
                    { "<leader>dn", dap.continue,          desc = "DAP toggle launch/continue" },
                    { "<F5>",       dap.continue,          desc = "DAP toggle launch/continue" },
                    { "<F10>",      dap.step_over,         desc = "DAP step over" },
                    { "<F11>",      dap.step_into,         desc = "DAP step into" },
                    { "<F12>",      dap.step_out,          desc = "DAP step out" },
                    { "<leader>dr", dap.repl.open,         desc = "DAP open REPL" },
                    { "<leader>dc", tdap.commands,         desc = "DAP commands" },
                    { "<leader>dC", tdap.configurations,   desc = "DAP configurations" },
                    { "<leader>dB", tdap.list_breakpoints, desc = "DAP list breakpoints" },
                    { "<leader>dv", tdap.variables,        desc = "DAP variables" },
                    { "<leader>df", tdap.frames,           desc = "DAP frames" },
                }
            end,
            config = function()
                vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'Red' })
                vim.cmd [[hi DapStoppedLine guibg=#9d2715]]
                vim.fn.sign_define('DapStopped', { text = '●', texthl = 'Red', linehl = 'DapStoppedLine' })

                local dap = require("dap")
                dap.adapters.lldb = {
                    type = "server",
                    port = "${port}",
                    executable = {
                        command = vim.fn.glob(vim.fn.stdpath("data") ..
                            "/mason/packages/codelldb/extension/adapter/codelldb"),
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
                dap.adapters.python = {
                    type = 'executable',
                    command = "/usr/bin/python",
                    args = { '-m', 'debugpy.adapter' },
                }
                dap.configurations.python = {
                    {
                        type = 'python',
                        request = 'launch',
                        name = "Launch file",
                        program = "${file}",
                        pythonPath = function()
                            return '/usr/bin/python'
                        end,
                    },
                }
            end
        }
    }
}
