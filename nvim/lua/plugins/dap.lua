return {
    {
        -- Debugger interface
        'mfussenegger/nvim-dap',
        -- UI for debugger
        dependencies = {
            {'rcarriga/nvim-dap-ui'},
            {'nvim-neotest/nvim-nio'},
        },
        config = function()
            -- DAP configuration
            local dap = require('dap')

            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = '/home/rayhaan/.local/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true,
                    setupCommands = {  
                        { 
                            text = '-enable-pretty-printing',
                            description =  'enable pretty printing',
                            ignoreFailures = false 
                        },
                    },
                },
            }

            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            local dapui = require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            dapui.setup()

            vim.keymap.set("n", "<Leader>c", "<Cmd> lua require'dap'.run_to_cursor()<CR>", opts)
            vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
            vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
            vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
            vim.keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
            vim.keymap.set("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
            vim.keymap.set("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
            vim.keymap.set("n", "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
            vim.keymap.set("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
            vim.keymap.set("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
        end
    },
}
