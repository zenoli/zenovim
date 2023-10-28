local utils = require "plugins.dap.utils"

return {
    {
        "<leader>b",
        function()
            require "dap".toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
    },
    {
        "<leader>B",
        function()
            utils.set_conditional_breakpoint()
        end,
        desc = "Set conditional breakpoint",
    },
    {
        "<leader>L",
        function()
            utils.set_logpoint()
        end,
        desc = "Set logpoint",
    },
    {
        "<leader>dd",
        function()
            require "dap".continue()
        end,
        desc = "Debug start/continue",
    },
    {
        "<leader>dl",
        function()
            require "dap".run_last()
        end,
        desc = "Run last debug configuration",
    },
    {
        "<leader>dw",
        function()
            utils.focus_dapui_window "Watches"
        end,
        desc = "Focus watches window",
    },
    {
        "<leader>db",
        function()
            utils.focus_dapui_window "Breakpoints"
        end,
        desc = "Focus breakpoints window",
    },
    {
        "<leader>dv",
        function()
            utils.focus_dapui_window "Scopes"
        end,
        desc = "Focus scopes windows",
    },
    {
        "<leader>ds",
        function()
            utils.focus_dapui_window "Stacks"
        end,
        desc = "Focus stacks window",
    },
    {
        "<leader>dt",
        function()
            require "dapui".toggle()
        end,
        desc = "Toggle debug UI windows",
    },
    {
        "<leader>dq",
        function()
            require "dap".terminate()
            require "dapui".close()
        end,
        desc = "Quit debugger",
    },
    {
        "[s",
        function()
            require "dap".up()
        end,
        desc = "Stackframe up",
    },
    {
        "]s",
        function()
            require "dap".down()
        end,
        desc = "Stackframe down",
    },
    {
        "<cr>",
        function()
            utils.dap_keybind("run_to_cursor", [[\<cr>]])
        end,
        desc = "Run to cursor",
    },
    {
        "J",
        function()
            utils.dap_keybind("step_over", "J")
        end,
        desc = "Step over",
    },
    {
        "L",
        function()
            utils.dap_keybind("step_into", "$")
        end,
        desc = "Step into",
    },
    {
        "H",
        function()
            utils.dap_keybind("step_out", "^")
        end,
        desc = "Step out",
    },
    {
        "<leader>dB",
        function()
            require "dap".step_back()
        end,
        desc = "Step back",
    },
    {
        "<leader>E",
        function()
            require "dapui".eval()
        end,
        mode = { "n", "v" },
        desc = "Dap evaluale expression",
    },
}
