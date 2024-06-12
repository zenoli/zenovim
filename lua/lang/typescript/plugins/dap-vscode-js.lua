return {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
        debugger_path = "/home/olivier/.local/share/nvim/lazy/vscode-js-debug",
        adapters = {
            "pwa-node",
            "pwa-chrome",
            "pwa-msedge",
            "node-terminal",
            "pwa-extensionHost",
        },
    },
}
