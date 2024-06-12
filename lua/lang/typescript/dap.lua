return {
    "mfussenegger/nvim-dap",
    opts = {
        configurations = {
            typescript = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require "dap.utils".pick_process,
                    cwd = "${workspaceFolder}",
                },
            },
        },
    },
}
