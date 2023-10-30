local bash_debug_adapter_bin = require("plugins.mason.utils").mason_bin_path()
    .. "/bash-debug-adapter"
local bash_debug_adapter_path = require("plugins.mason.utils").mason_package_path()
    .. "/bash-debug-adapter/extension/bashdb_dir"

return {
    "mfussenegger/nvim-dap",
    opts = {
        adapters = {
            bashdb = {
                type = "executable",
                command = bash_debug_adapter_bin,
                name = "bashdb",
            },
        },
        configurations = {
            sh = {
                {
                    type = "bashdb",
                    request = "launch",
                    name = "Launch file",
                    showDebugOutput = true,
                    pathBashdb = bash_debug_adapter_path .. "/bashdb",
                    pathBashdbLib = bash_debug_adapter_path,
                    trace = true,
                    file = "${file}",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    pathCat = "cat",
                    pathBash = "/bin/bash",
                    pathMkfifo = "mkfifo",
                    pathPkill = "pkill",
                    args = {},
                    env = {},
                    terminalKind = "integrated",
                },
            },
        },
    },
}
